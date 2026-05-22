#!/bin/sh
set -e
FILE="sentence.tar.gz"
trap 'rm -f "$FILE"' EXIT
curl -L https://github.com/8ta4/sentence/releases/download/v0.1.2/sentence.tar.gz -o $FILE
echo "9736ca13ceaafdf15eaa06fa974e6ea76844a8d90a8a6ea732ea44c34193eba9  $FILE" | shasum -a 256 -c
tar -xzf $FILE