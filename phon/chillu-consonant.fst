#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=D# = കുചടതപശ
$D$ = {[#=D#]}:{[#=D#][#Virama#][#=D#]}

% chillu followed by hard consonants get duplicated

$dup-chillus-hard-cons$ = $D$ ^-> ([#Chillus#] [#POS##BM##Numbers##TMP##Lsym#]+ __ [#Letters#]+ )

$chillu-consonant$ = $dup-chillus-hard-cons$

$chillu-consonant$ || .*
