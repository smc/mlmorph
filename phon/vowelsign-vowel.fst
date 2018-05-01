#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=Y# = ാീെിഎ
$Y$ = {[#=Y#]}:{[#=Y#][യ]}
$insert-ya$ =  $Y$ ^-> (__ [#POS##BM##Numbers##TMP##Lsym#]+ [#Vowels#] )

#=V# = ുൂ
$va-insert$ = {[#=V#]}:{[#=V#][വ]}
% Sometimes the u -sign get deleted if followed by vowel. വന്നു+ ഇല്ല = വന്നില്ല
$u-del$ = [ു]:<del>

$u-change$ = $va-insert$ | $u-del$
$u-cases$ =  $u-change$ ^-> (__ [#POS##BM##Numbers##TMP##Lsym#]+ [#Vowels#] )

$vowelsign-vowel$ = $insert-ya$ || $u-cases$

$tests$ = പിടി <hundreds> ആന <Noun> |\
	നടു<n> ഇൽ<n>
% Uncomment below line for testing
% $tests$ ||\
$vowelsign-vowel$ || .*
