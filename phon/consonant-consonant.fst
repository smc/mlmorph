#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=D# = കചടതപശ
$D$ = {[#=D#]}:{[#=D#][#Virama#][#=D#]}

% consonant followed by hard consonants get duplicated
% Only when the second word is a Malayalam word
% തല + കുറി = തലക്കുറി
% ഓല + പീപ്പി=ഓലപ്പീപ്പി
% ചാണക+പച്ച = ചാണകപ്പച്ച

$dup-cons-hard-cons$ = $D$ ^-> ( [#Consonants#] [#POS#<n-v-compound>#BM##Numbers##TMP#]+ __ [#Letters#]+ [#MALAYALAMPOS##BM##Numbers##infl##TMP##Lsym##compounds#] )

$consonant-consonant$ = $dup-cons-hard-cons$

$consonant-consonant$
