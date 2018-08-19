#!/bin/bash
for filename in ../lexicon/*.lex; do
    echo "Sorting $filename"
    LC_ALL=ml_IN sort "$filename" -o "$filename"
done
