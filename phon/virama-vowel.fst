#include "../symbols.fst"

ALPHABET = [#AAsym#] [#Virama#]:<>

% Virama get deleted if followed by a vowel
% ആട് + അല്ല => ആടല്ല
% പൂവ് + അമ്പലം => പൂവമ്പലം

$virama-vowel$ = [#Virama#] <=> <> ( [#POS##BM##Numbers##TMP#]+ [#Vowels#] )

$tests$ =<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>അമ്പലം<n><>:<RB><>:<EoW>

% Uncomment below line for testing
% $tests$ ||\
$virama-vowel$ || .*
