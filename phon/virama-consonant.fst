#include "../symbols.fst"

ALPHABET = [#AAsym#] [#POS##BM##Numbers#]

% Virama get replaced by u sign if followed by consonant

$virama-consonant$ = {[#Virama#]}: {ു} ^-> (__ [#POS##BM##Numbers##TMP#]+ [#Consonants#] )

$tests$ =<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>മണം<n><>:<RB><>:<EoW> \
<>:<BoW>ഇരുപത്<tens><num><RB><>:<EoW><>:<BoW>രൂപ<n><>:<RB><>:<EoW>
% Uncomment below line for testing
% $tests$ ||\
$virama-consonant$ || .*
