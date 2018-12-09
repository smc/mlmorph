#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=D# = കചടതപശ
$D$ = {[#=D#]}:{[#=D#][#Virama#][#=D#]}

% consonant followed by hard consonants get duplicated
% തല + കുറി = തലക്കുറി
% ഓല + പീപ്പി=ഓലപ്പീപ്പി
% ചാണക+പച്ച = ചാണകപ്പച്ച

$dup-cons-hard-cons$ = $D$ ^-> ( [#Consonants#] [#MALAYALAMPOS##BM##Numbers##TMP#]+ __ [#Consonants##Vowels##VowelSigns##Anuswara##Chillus#]+ )

$consonant-consonant$ = $dup-cons-hard-cons$

$consonant-consonant$ || .*
