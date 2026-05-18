#!/bin/sh
set -e
FILE="sentence.tar.gz"
trap 'rm -f "$FILE"' EXIT
curl -L https://github.com/8ta4/sentence/releases/download/v0.1.1/sentence.tar.gz -o $FILE
echo "40e70f37f6cf29296adcbdf57334c658fe9a13d2fbc4ce49b91137ec96183e8d  $FILE" | shasum -a 256 -c
tar -xzf $FILE