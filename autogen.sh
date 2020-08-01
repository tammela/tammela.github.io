#!/bin/bash

# check if pandoc is installed
if ! [ -x "$(command -v pandoc)" ]; then
  echo 'Error: pandoc is not installed.' >&2
  exit 1
fi

# generate index.html
echo 'Generating index.html'
pandoc -s -c src/pandoc.css src/index.md -o index.html

# generate articles
for f in $(ls src/*.md | grep -v "index.md"); do
   echo "Generating $f"
   output=$(echo "$f" | sed "s/src/kernel/" | sed "s/\.md/\.pdf/")
#   pandoc -s "$f" --pdf-engine=xelatex -o "$output"
done
