#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Virama get deleted if followed by a vowel
% ആട് + അല്ല => ആടല്ല
% പൂവ് + അമ്പലം => പൂവമ്പലം

$samvruthokara-del$ = {ു്}:{<del>} ^-> ( __ [#POS##BM##Numbers##TMP##Lsym#]+ [#Vowels#] )
$virama-del$ = {്}:<del> ^-> ( __ [#POS##BM##Numbers##TMP##Lsym#]+ [#Vowels#] )

$virama-vowel$= $samvruthokara-del$ || $virama-del$
$tests$ =<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>അമ്പലം<n><>:<RB><>:<EoW> |\
	<>:<BoW>പൂവു്<n><>:<RB><>:<EoW><>:<BoW>അമ്പലം<n><>:<RB><>:<EoW>

% Uncomment below line for testing
% $tests$ ||$virama-vowel$ >> "virama-vowel.test.a"

$virama-vowel$
