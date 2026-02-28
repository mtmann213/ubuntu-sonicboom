#!/usr/bin/env bash
set -euo pipefail

PRINT_CONFIG=0
LIST_ONLY=0
RDPW_ARG=""
RDPW="${RDPW:-}"

usage() {
  cat <<'USAGE'
Usage:
  avd.sh [--help] [--list] [--print-config|--dry-run] [RDPW_FILE]

Environment:
  AVD_UPN   (recommended) UPN like: first.last@army.mil
  AVD_USER  Alternative to AVD_UPN: .\AzureAD\first.last@army.mil
  AVD_TENANT Optional tenant GUID. If missing/invalid, derived from the .rdpw.
  MAX_REDIRECTS Optional. Default: 3
  RDPW Optional path if not passing as arg.

Examples:
  AVD_UPN="first.last@army.mil" ./avd.sh "$HOME/avd/Army Desktop.rdpw"
  AVD_USER=".\AzureAD\first.last@army.mil" ./avd.sh --print-config
  MAX_REDIRECTS=5 AVD_UPN="first.last@army.mil" ./avd.sh --dry-run
  ./avd.sh --list

Notes:
  --print-config / --dry-run prints derived values and exits 0 (no connection attempt).
  --list prints discovered *.rdpw files in ~/avd and ~/Downloads and exits.
USAGE
}

list_rdpw_candidates() {
  local tmp
  tmp="$(mktemp)"
  trap 'rm -f "$tmp"' RETURN

  local found_any=0
  local dir

  for dir in "$HOME/avd" "$HOME/Downloads"; do
    [[ -d "$dir" ]] || continue
    while IFS= read -r -d '' f; do
      found_any=1

      local epoch ts tenant
      epoch="$(stat -c %Y "$f" 2>/dev/null || echo 0)"
      ts="$(date -d "@$epoch" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo "$epoch")"

      tenant="$(grep -m1 '^aadtenantid:s:' "$f" | cut -d: -f3- | tr -d '\r' || true)"
      [[ -n "$tenant" ]] || tenant="UNKNOWN"

      printf '%s\t%s\t%s\t%s\n' "$tenant" "$epoch" "$ts" "$f" >> "$tmp"
    done < <(find "$dir" -maxdepth 1 -type f -name '*.rdpw' -print0 2>/dev/null)
  done

  if [[ "$found_any" -eq 0 || ! -s "$tmp" ]]; then
    echo "No *.rdpw files found in:"
    echo "  - $HOME/avd"
    echo "  - $HOME/Downloads"
    return 1
  fi

  sort -t $'\t' -k1,1 -k2,2nr "$tmp" | awk -F'\t' '
    BEGIN {
      green = "\033[1;32m";
      amber = "\033[1;33m";
      reset = "\033[0m";
      prev = "";
      print "RDPW candidates (grouped by tenantId; newest per tenant is green):\n";
      print "Search paths:";
      print "  - ~/avd";
      print "  - ~/Downloads\n";
    }
    {
      tenant=$1; epoch=$2; ts=$3; path=$4;

      if (tenant != prev) {
        if (NR > 1) print "";
        print "TenantId: " tenant;
        print "timestamp\t\tpath\t\ttenantId";
        first_in_group = 1;
        prev = tenant;
      }

      color = (first_in_group ? green : amber);
      printf "%s%s\t%s\t%s%s\n", color, ts, path, tenant, reset;

      first_in_group = 0;
    }
  '
}

pick_newest_rdpw() {
  local dir="$1"
  [[ -d "$dir" ]] || return 1

  local newest
  newest="$(
    find "$dir" -maxdepth 1 -type f -name '*.rdpw' -printf '%T@ %p\0' 2>/dev/null \
      | sort -zr -n \
      | head -z -n 1 \
      | tr -d '\0' \
      | cut -d' ' -f2-
  )"

  [[ -n "${newest:-}" ]] || return 1
  printf '%s' "$newest"
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --list)
        LIST_ONLY=1
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      --print-config|--dry-run)
        PRINT_CONFIG=1
        shift
        ;;
      --)
        shift
        break
        ;;
      -*)
        echo "ERROR: Unknown option: $1" >&2
        usage >&2
        exit 2
        ;;
      *)
        RDPW_ARG="$1"
        shift
        ;;
    esac
  done
}

resolve_rdpw() {
  RDPW="${RDPW_ARG:-${RDPW:-}}"
  if [[ -z "$RDPW" ]]; then
    RDPW="$(pick_newest_rdpw "$HOME/avd" || true)"
  fi
  if [[ -z "$RDPW" ]]; then
    RDPW="$(pick_newest_rdpw "$HOME/Downloads" || true)"
  fi
}

require_rdpw() {
  if [[ -z "$RDPW" ]]; then
    echo "ERROR: No .rdpw file found." >&2
    echo "  - Pass one as an argument, or" >&2
    echo "  - Set RDPW=/path/to/file.rdpw, or" >&2
    echo "  - Put a .rdpw in ~/avd (preferred) or ~/Downloads" >&2
    exit 1
  fi

  if [[ ! -f "$RDPW" ]]; then
    echo "ERROR: RDPW not found: $RDPW" >&2
    exit 1
  fi
}

load_env_defaults() {
  AVD_UPN="${AVD_UPN:-}"
  AVD_USER="${AVD_USER:-}"
  AVD_TENANT="${AVD_TENANT:-}"
  MAX_REDIRECTS="${MAX_REDIRECTS:-3}"
}

derive_avd_user() {
  if [[ -n "$AVD_USER" ]]; then
    return
  fi

  if [[ -z "$AVD_UPN" ]]; then
    echo "ERROR: Set AVD_UPN (first.last@army.mil) or AVD_USER (.\\AzureAD\\first.last@army.mil)" >&2
    exit 1
  fi

  AVD_USER=".\AzureAD\\${AVD_UPN}"
}

derive_avd_tenant() {
  local guid_re='^[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}$'
  local tenant_from_file

  tenant_from_file="$(grep -m1 '^aadtenantid:s:' "$RDPW" | cut -d: -f3- | tr -d '\r' || true)"

  if [[ ! "$AVD_TENANT" =~ $guid_re ]]; then
    AVD_TENANT="$tenant_from_file"
  fi

  if [[ ! "$AVD_TENANT" =~ $guid_re ]]; then
    echo "ERROR: Could not determine AVD_TENANT." >&2
    echo "       Found: '${AVD_TENANT}'" >&2
    echo "       Expected a line like: aadtenantid:s:<guid> inside $RDPW" >&2
    exit 1
  fi
}

print_config() {
  echo "Derived configuration:"
  echo "  RDPW        : $RDPW"
  echo "  AVD_USER    : $AVD_USER"
  echo "  AVD_TENANT  : $AVD_TENANT"
  echo "  MAX_REDIRECTS: $MAX_REDIRECTS"
  echo
  echo "FreeRDP command (for reference):"
  echo "  sdl-freerdp3 \"$RDPW\" \\"
  echo "    /gateway:type:arm \\"
  echo "    /sec:aad \\"
  echo "    /u:\"$AVD_USER\" \\"
  echo "    /smartcard \\"
  echo "    /azure:tenantid:$AVD_TENANT,use-tenantid:on,ad:login.microsoftonline.us,avd-scope:https://www.wvd.azure.us/.default,avd-access:https://login.microsoftonline.com/common/oauth2/nativeclient \\"
  echo "    /timeout:600000 \\"
  echo "    /log-level:INFO"
}

require_runtime_dependencies() {
  command -v expect >/dev/null 2>&1 || { echo "ERROR: expect not installed (sudo pacman -S expect)" >&2; exit 1; }
  command -v sdl-freerdp3 >/dev/null 2>&1 || { echo "ERROR: sdl-freerdp3 not found (sudo pacman -S freerdp)" >&2; exit 1; }
}

write_expect_script() {
  local tmp="$1"

  cat >"$tmp" <<'EXPECT'
set timeout -1

set rdpw $env(RDPW)
set user $env(AVD_USER)
set tenant $env(AVD_TENANT)
set max_redirects $env(MAX_REDIRECTS)

set seen 0

proc open_firefox {url} {
  catch {exec firefox --private-window $url &}
}

spawn -noecho sdl-freerdp3 $rdpw \
  /gateway:type:arm \
  /sec:aad \
  /u:$user \
  /smartcard \
  /azure:tenantid:$tenant,use-tenantid:on,ad:login.microsoftonline.us,avd-scope:https://www.wvd.azure.us/.default,avd-access:https://login.microsoftonline.com/common/oauth2/nativeclient \
  /timeout:600000 \
  /log-level:INFO

while {1} {
  expect {
    -re {Browse to:\s+(https?://\S+)} {
      set url $expect_out(1,string)
      send_user "\nFreeRDP auth URL:\n$url\n"
      open_firefox $url
      exp_continue
    }

    -re {Paste redirect URL here:} {
      incr seen
      if {$seen > $max_redirects} {
        send_user "\nToo many redirect rounds ($seen). Exiting.\n"
        exit 2
      }

      send_user "\nPaste the FULL redirect URL (must include ?code=...) then press Enter:\n> "
      set tty [open "/dev/tty" r]
      gets $tty redir
      close $tty

      send "$redir\r"
      exp_continue
    }

    eof {
      catch wait result
      exit [lindex $result 3]
    }
  }
}
EXPECT
}

run_connection() {
  local tmp

  export RDPW AVD_USER AVD_TENANT MAX_REDIRECTS

  tmp="$(mktemp --suffix=.exp)"
  trap 'rm -f "$tmp"' EXIT

  write_expect_script "$tmp"
  expect -f "$tmp"
}

main() {
  parse_args "$@"

  if [[ "$LIST_ONLY" -eq 1 ]]; then
    list_rdpw_candidates
    exit 0
  fi

  resolve_rdpw
  require_rdpw
  load_env_defaults
  derive_avd_user
  derive_avd_tenant

  if [[ "$PRINT_CONFIG" -eq 1 ]]; then
    print_config
    exit 0
  fi

  require_runtime_dependencies
  run_connection
}

main "$@"
