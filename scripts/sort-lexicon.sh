#!/bin/bash
for filename in ../lexicon/*.lex; do
    echo "Sorting $filename"
    LC_ALL=ml_IN sort -u "$filename" -o "$filename"
done
echo "Lexicon size:"
wc -l ../lexicon/*.lex
