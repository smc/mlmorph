#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=D# = കുചടതപശ
$D$ = {[#=D#]}:{[#=D#][#Virama#][#=D#]}

% Vowel sign followed by hard consonants get geminated
% Only when the second word is a Malayalam word
% അടി + പരപ്പ് => അടിപ്പരപ്പ്
% നൂറ്റി + പത്ത് => നൂറ്റിപ്പത്ത്
% അമ്മി + കല്ല് => അമ്മിക്കല്ല്
% സൂചി + തുള => സൂചിത്തുള

$MALAYALAMSUFFFIX$ = [#Letters#]* [#MALAYALAMPOS##BM##Numbers##infl##TMP##Lsym##compounds#]+

$dup-vowelsign-hard-cons$ = $D$ ^-> ( [#VowelSigns##Vowels#] [#POS##BM##Numbers##TMP#]+ __ $MALAYALAMSUFFFIX$  )

% When noun is inflected and compound with a verb, duplication can happen.
% Example: കവിതയെക്കുറിക്കുക, but not when ചിരികണ്ടാൽ or തെറിപറഞ്ഞു
$dup-vowelsign-hard-cons-nv-compound$ = $D$ ^-> ( [#VowelSigns##Vowels#] [#POS#]+ [#ninfl#]+ <n-v-compound> [#BM##Numbers##TMP#]+ __ $MALAYALAMSUFFFIX$  )

$vowelsign-consonant$ = $dup-vowelsign-hard-cons$ || $dup-vowelsign-hard-cons-nv-compound$

$tests$ = നൂറ്റി <hundreds> പതിനൊന്ന് <n> \
	| അടി <n> പരപ്പ് <n> \
	| സൂചി <n> തുള <n> \
	| ആൽ <n> മരം <n> \ % No duplication, മ is not hard consonant
	| ആൽ <n> തറ <n> \
	| ആന <n> പുറം <n> \
	| ആന <n> വണ്ടി <n> \ % No duplication, വ is not hard consonant
	| കവിത<n><accusative><n-v-compound>കുറിക്കുക<v> % കവിതയെക്കുറിക്കുക
% Uncomment below line for testing
% $tests$ ||\
$vowelsign-consonant$
