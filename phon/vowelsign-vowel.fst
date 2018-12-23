#include "../symbols.fst"

ALPHABET = [#AAsym#]

#=Y# = ാ  ീ  െ  ി എ
$Y$ = {[#=Y#]}:{[#=Y#][യ]}
$insert-ya$ = $Y$ ^-> (__ [#MALAYALAMPOS##BM##Numbers##TMP##Lsym##compounds#]+ [#Vowels#] )

% പോയി + ഇല്ല/ഇരുന്നു/ഇരിക്കുക.. -> പോയില്ല/പോയിരുന്നു.. along with പോയിയില്ല...
$yi-yi-special-case$ = {പോയി}:{പോയ<del>} ^-> (__ [#POS##BM##Numbers##TMP##Lsym#]+ [ഇ] )

#=V# = ുൂ
$va-insert$ = {[#=V#]}:{[#=V#][വ]}
$va-insert-case$ = $va-insert$ ^-> (__ [#POS##BM##Numbers##TMP##Lsym#]+ [#Vowels#] )

% Sometimes the u -sign get deleted if followed by vowel. വന്നു+ ഇല്ല = വന്നില്ല, വന്നെങ്കിൽ, ചെയ്തില്ല
% But not അണു+ഇന്റെ !== അണിന്റെ
$u-del$ = {ന്നു} : {ന്ന<del>} | {ണ്ടു} : {ണ്ട<del>} | {ണു} : {ണ<del>} | {തു} : {ത<del>}
$u-delete-case$ = $u-del$ ^-> ([#Consonants##VowelSigns##Virama#] __ [#POS##BM##Numbers##TMP##Lsym#]+ [ഇഎഒഓ] )

$u-cases$ = $u-delete-case$ || $va-insert-case$
$vowelsign-vowel$ = $yi-yi-special-case$ || $insert-ya$ || $u-cases$

$tests$ = പിടി <hundreds> ആന <Noun> |\
	നടു<n> ഇൽ<n> |\
	ആതി<n> ഇരിക്കുക<v>
% Uncomment below line for testing
$tests$ || $vowelsign-vowel$ || .* >> "vowelsign-vowel.test.a"
$vowelsign-vowel$ || .*
