#include "../symbols.fst"

ALPHABET = [#AAsym#] [#POS##BM##Numbers#] <>:യ

$insert-ya$ = <>:<EoW><>:<BoW> <> <=> യ  ( [#Consonants#] )

$vowelsign-vowel$ = $insert-ya$

$tests$ = പിടി <hundreds> ആന <Noun>
% Uncomment below line for testing
% $tests$ ||\
$vowelsign-vowel$ || .*
