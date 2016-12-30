#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=D# = കുചടതപശ
$D$ = {[#=D#]}:{[#=D#][#Virama#][#=D#]}

% Vowel sign followed by hard consonants get duplicated
% അടി + പരപ്പ് => അടിപ്പരപ്പ്
% നൂറ്റി + പത്ത് => നൂറ്റിപ്പത്ത്
% അമ്മി + കല്ല് => അമ്മിക്കല്ല്
% സൂചി + തുള => സൂചിത്തുള

$dup-vowelsign-hard-cons$ = $D$ ^-> ( [#VowelSigns#] [#POS##BM##Numbers##TMP#]+ __ [#Letters#] )

$vowelsign-consonant$ = $dup-vowelsign-hard-cons$

$tests$ = നൂറ്റി <hundreds> പതിനൊന്ന് <Noun> \
	| അടി <Noun> പരപ്പ് <Noun> \
	| സൂചി <Noun> തുള <Noun> \
	| ആൽ <Noun> മരം <Noun> \ % No duplication, മ is not hard consonant
	| ആൽ <Noun> തറ <Noun> \
	| ആന <Noun> പുറം <Noun> \
	| ആന <Noun> വണ്ടി <Noun> % No duplication, വ is not hard consonant
% Uncomment below line for testing
% $tests$ ||\
$vowelsign-consonant$ || .*
