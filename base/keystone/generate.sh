#!/bin/bash
set -eu -o pipefail
safe_source () { [[ ! -z ${1:-} ]] && source $1; _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; _sdir=$(dirname "$(readlink -f "$0")"); }; safe_source

name_template(){
  echo "$1-keystone.fcstd"
}

dest_dir="../../models/$(basename $_sdir)"
mkdir -p "$dest_dir"
while read -r line; do
  [[ $line = \#* ]] || [[ $line = "" ]] && continue # skip comment lines
  # do work here
  echo "Generating `name_template $line`"
  cp *.fcstd "$dest_dir/`name_template $line`"
done < $_sdir/variants.txt
