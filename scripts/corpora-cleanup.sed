# Misc clean up on coverage corpora, lexicon
# Example: sed -i -f corpora-cleanup.sed ../tests/coverage/*.txt
# Chillu normalization
s/ന്‍/ൻ/g
s/ള്‍/ൾ/g
s/ല്‍/ൽ/g
s/ര്‍/ർ/g
s/ന്‍/ൻ/g
s/ണ്‍/ൺ/g
# Remove ZWNJ at end of words
s/\xE2\x80\x8C$//g
# Remove all other ZWJ
s/\xE2\x80\x8D//g
# Remove all soft hyphens
s/\xC2\xAD//g
# Remove all zero width spaces
s/\xE2\x80\x8B//g
# Replace old au sign with new one
s/ൌ/ൗ/g

#Common mistakes
s/പക്ഷെ/പക്ഷേ/g
# ZWNJs -Remove all ZWNJs that are not after a VIRAMA sign.
s/([അ-ൌ])\xE2\x80\x8C/\1/g
s/ഒാ/ഓ/g
s/ൻറെ/ന്റെ/g
s/ൻറ്$/ന്റ്/g
s/ൻറും$/ന്റും/g
s/ൻറിൽ$/ന്റിൽ/g
# ുൻപോൾ - ുമ്പോൾ
s/ുൻപോൾ/ുമ്പോൾ/g