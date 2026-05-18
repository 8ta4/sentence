#!/bin/sh
set -e
trap 'rm -f sentence.tar.gz' EXIT
curl -L https://github.com/8ta4/sentence/releases/download/v0.1.1/sentence.tar.gz -o sentence.tar.gz
echo '40e70f37f6cf29296adcbdf57334c658fe9a13d2fbc4ce49b91137ec96183e8d  sentence.tar.gz' | shasum -a 256 -c
tar -xzf sentence.tar.gz