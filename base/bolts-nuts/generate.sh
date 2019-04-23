#!/bin/bash
set -eu -o pipefail
safe_source () { [[ ! -z ${1:-} ]] && source $1; _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; _sdir=$(dirname "$(readlink -f "$0")"); }; safe_source


dest_dir="../../models/$(basename $_sdir)"
mkdir -p "$dest_dir"
while read -r line; do
  [[ $line = \#* ]] || [[ $line = "" ]] && continue # skip comment lines
  # do work here
  echo "Generating $line"
  cp *-bolts.fcstd "$dest_dir/$line-bolts.fcstd"
done < $_sdir/bolt-variants.txt
