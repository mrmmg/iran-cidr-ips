#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   json_to_txt.sh <input.json> <output.txt>
#
# Extracts all ip_cidr entries from a sing-box decompiled rule-set JSON
# and writes a sorted, unique CIDR list to the output file.

INPUT="$1"
OUTPUT="$2"

jq -r '
  .rules[]
  | select(.ip_cidr != null)
  | .ip_cidr[]
' "$INPUT" | sort -u > "$OUTPUT"
