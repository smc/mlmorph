#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <perlative> <pl> <del> <dup>

% perlative inflection rules
#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

$anuswara-forms$ = {<perlative>}:{<del>ത്തിലൂടെ<infl_marker>} | \
	{<perlative>}:{<del>ത്തിൽകൂടെ<infl_marker>} | \
	{<perlative>}:{<del>ത്തിൽക്കൂടെ<infl_marker>}

$perlative-anuswara-step1$ = $anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary#]+ __)
$perlative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary#]+ <del> )
$perlative-anuswara$ = $perlative-anuswara-step1$ || $perlative-anuswara-step2$

$perlative-cons-vowel-forms$ = {<perlative>}:{ഇലൂടെ<infl_marker>} | \
	{<perlative>}:{ഇൽക്കൂടെ<infl_marker>} | \
	{<perlative>}:{ഇൽകൂടെ<infl_marker>}

$perlative-cons-vowel$ = $perlative-cons-vowel-forms$ ^-> ([#Consonants##VowelSigns#] [#inflboundary#]+ __)

$virama-forms$ = {<perlative>}:{ഇലൂടെ<infl_marker>} | \
	{<perlative>}:{ഇൽക്കൂടെ<infl_marker>} | \
	{<perlative>}:{ഇൽകൂടെ<infl_marker>}
$perlative-virama-chillus$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#inflboundary#]+ __)

$ta-forms$ = {<perlative>}:{<dup>ടിലൂടെ<infl_marker>} |\
	{<perlative>}:{<dup>ടിൽകൂടെ<infl_marker>} | \
	{<perlative>}:{<dup>ടിൽക്കൂടെ<infl_marker>}
$perlative-ta$ = $ta-forms$ ^-> ([#VowelSigns#] ട [#Virama#] [#inflboundary#]+ __)

$perlative$ = $perlative-cons-vowel$ || $perlative-ta$ || $perlative-virama-chillus$ || $perlative-anuswara$

$tests$ = മഴ<n><RB><perlative> | മുറ്റം<n><RB><perlative> | കിളി<n><RB><perlative> | മഴ<plural>കൾ<EoW><RB><perlative> | കേരളം<n><RB><perlative>
$tests$ || $perlative$ >> "perlative-test.a"

$perlative$
