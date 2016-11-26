%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $Dup$: Duplication of some root initial consonants during agglutination
#include "../symbols.fst"

ALPHABET = [#AAsym#] [#POS##BM##Numbers#]

#=D# = കചടതപ
$D$ = {[#=D#]}:{[#=D#][#Virama#][#=D#]}

% Vowel sign followed by hard consonants get duplicated
% അടി + പരപ്പ് => അടിപ്പരപ്പ്
% നൂറ്റി + പത്ത് => നൂറ്റിപ്പത്ത്
% അമ്മി + കല്ല് => അമ്മിക്കല്ല്
% സൂചി + തുള => സൂചിത്തുള

$dup-vowelsign-hard-cons$ = [#VowelSigns#] [#POS##BM##Numbers#]+ $D$ ^-> (__ [#Consonants##VowelSigns#] )
$dup-chillus-hard-cons$ = [#Chillus#] [#POS##BM##Numbers#]+ $D$ ^-> (__ [#Consonants##VowelSigns#] )
$dup-cons-hard-cons$ = [#Consonants#] [#POS##BM##Numbers#]+ $D$ ^-> (__ [#Consonants##VowelSigns#] )

ALPHABET = [#AAsym#] [#POS##BM##Numbers#]

$tests$ = നൂറ്റി <hundreds> പതിനൊന്ന് <Noun> \
	| അടി <Noun> പരപ്പ് <Noun> \
	| സൂചി <Noun> തുള <Noun> \
	| ആൽ <Noun> മരം <Noun> \ % No duplication, മ is not hard consonant
	| ആൽ <Noun> തറ <Noun> \
	| ആന <Noun> പുറം <Noun> \
	| ആന <Noun> വണ്ടി <Noun> % No duplication, വ is not hard consonant

$Dup$ = $dup-vowelsign-hard-cons$ \
	|| $dup-chillus-hard-cons$ \
	|| $dup-cons-hard-cons$
% Uncomment below line for testing
% $tests$ ||\
$Dup$ || .*
