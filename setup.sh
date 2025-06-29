#!/bin/bash

set -euo pipefail

LOGFILE=$(mktemp --tmpdir setuplog.XXXXXX)
REMOTE=0
BRANCH="main"

# Usage/help function
usage() {
  echo "Usage: $0 [--remote] [--branch <branch-name>]"
  exit 1
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --remote)
      REMOTE=1
      shift
      ;;
    --branch)
      [[ $# -lt 2 ]] && usage
      BRANCH="$2"
      shift 2
      ;;
    --help|-h)
      usage
      ;;
    *)
      echo "Unknown option: $1"
      usage
      ;;
  esac
done

# Base directory if local
BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Base URL for remote scripts — update to your GitHub repo
REMOTE_BASE_URL="https://raw.githubusercontent.com/terxor/setup/$BRANCH/install"

# Function to run a script (local or remote)
run_script() {
  local script_name="$1"
  if [[ $REMOTE -eq 1 ]]; then
    echo "Running remote: $script_name"
    curl -fsSL "$REMOTE_BASE_URL/$script_name" | bash >> "$LOGFILE"
  else
    echo "Running local: $script_name"
    "$BASE/install/$script_name" >> "$LOGFILE"
  fi
}

# Run install scripts
run_script "packages.sh"
run_script "packages-extn.sh"
run_script "packages-manual.sh"
run_script "dotfiles.sh"

echo "DONE"
