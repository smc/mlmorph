#include "../symbols.fst"

ALPHABET = [#AAsym#] [ആഇഈഊഋഎഏഐഒഓഔ]:[ാിീുൂൃെേൈൊോൗ] അ:<del>

% Delete Vowels and replace it by its vowel sign when the second word start with Vowel

$replace-vowel-by-sign-a$ = <>:<EoW><>:<BoW> അ<=><del> ( [#Letters#] )
$word-vowel$ = <>:<EoW><>:<BoW> [ആഇ] <=> [ാി] ( [#Consonants#] ) \
|| $replace-vowel-by-sign-a$

$tests$ =<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>ആയിരം<n><>:<RB><>:<EoW>

% Uncomment below line for testing
% $tests$ ||\
$word-vowel$ || .*
