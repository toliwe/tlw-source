#!/bin/bash

jbase="jekyll/"

function shrink {
  cat \
  | tr -d '\r' \
  | tr '\t\n' ' \r' \
  | sed 's/<!--/\t</g; s/-->/\t>/g' \
  | sed 's/\t<[^\t]*\t>//g' \
  | tr '\r' '\n' \
  | sed 's/  *$//' \
  | grep . \
  | sed 's/^  *//'
}
find "$jbase"/_site -name '*.html' | while read htmlf; do
  page="$(cat "$htmlf")"
  sz1="$(cat "$htmlf" | wc -c)"
  echo "$page" | shrink > "$htmlf"
  sz2="$(cat "$htmlf" | wc -c)"
  echo "[$sz1 -> $sz2] $htmlf"
done
