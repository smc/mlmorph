#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=Y# = ാീെി
$Y$ = {[#=Y#]}:{[#=Y#][യ]}
$insert-ya$ =  $Y$ ^-> (__ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )
#=V# = ുൊ
$V$ = {[#=V#]}:{[#=V#][വ]}
$insert-va$ =  $V$ ^-> (__ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )
$vowelsign-vowel$ = $insert-ya$ || $insert-va$

$tests$ = പിടി <hundreds> ആന <Noun>
% Uncomment below line for testing
% $tests$ ||\
$vowelsign-vowel$ || .*
