#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=Y# = ാീെിഎ
$Y$ = {[#=Y#]}:{[#=Y#][യ]}
$insert-ya$ =  $Y$ ^-> (__ [#POS##BM##Numbers##TMP##Lsym#]+ [#Vowels#] )
#=V# = ുൂ
$V$ = {[#=V#]}:{[#=V#][വ]}
$insert-va$ =  $V$ ^-> (__ [#POS##BM##Numbers##TMP##Lsym#]+ [#Vowels#] )
$vowelsign-vowel$ = $insert-ya$ || $insert-va$

$tests$ = പിടി <hundreds> ആന <Noun> |\
	നടു<n> ഇൽ<n>
% Uncomment below line for testing
% $tests$ ||\
$vowelsign-vowel$ || .*
