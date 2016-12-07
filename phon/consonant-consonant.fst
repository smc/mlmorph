#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=D# = കുചടതപശ
$D$ = {[#=D#]}:{[#=D#][#Virama#][#=D#]}

% consonant followed by hard consonants get duplicated
% തല + കുറി = തലക്കുറി
% ഓല + പീപ്പി=ഓലപ്പീപ്പി
% ചാണക+പച്ച = ചാണകപ്പച്ച

$dup-chillus-hard-cons$ = [#Chillus#] [#POS##BM##Numbers##TMP#]+ $D$ ^-> (__ [#Consonants##VowelSigns#] )
$dup-cons-hard-cons$ = [#Consonants#] [#POS##BM##Numbers##TMP#]+ $D$ ^-> (__ [#Consonants##VowelSigns#] )

$consonant-consonant$ = $dup-cons-hard-cons$

$consonant-consonant$ || .*
