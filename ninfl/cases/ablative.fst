#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <ablative> <pl> <del> <dup>

% ablative inflection rules
#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

$anuswara-forms$ = {<ablative>}:{<del>ത്തിൽനിന്നു<infl_marker>} | \
	{<ablative>}:{<del>ത്തിൽനിന്നു്<infl_marker>} | \
	{<ablative>}:{<del>ത്തിൽനിന്ന്<infl_marker>}

$ablative-anuswara-step1$ = $anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary#]+ __)
$ablative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary#]+ <del> )
$ablative-anuswara$ = $ablative-anuswara-step1$ || $ablative-anuswara-step2$

$ablative-cons-vowel-forms$ = {<ablative>}:{ഇൽനിന്ന്<infl_marker>} | \
	{<ablative>}:{ഇൽനിന്നു<infl_marker>} | \
	{<ablative>}:{ഇൽനിന്നു്<infl_marker>}

$ablative-cons-vowel$ = $ablative-cons-vowel-forms$ ^-> ([#Consonants##VowelSigns#] [#inflboundary#]+ __)

$virama-forms$ = {<ablative>}:{ഇൽനിന്ന്<infl_marker>} | \
	{<ablative>}:{ഇൽനിന്നു<infl_marker>} | \
	{<ablative>}:{ഇൽനിന്നു്<infl_marker>}
$ablative-virama-chillus$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#inflboundary#]+ __)

$ta-forms$ = {<ablative>}:{<dup>ടിൽനിന്നു<infl_marker>} |\
	{<ablative>}:{<dup>ടിൽനിന്നു്<infl_marker>} | \
	{<ablative>}:{<dup>ടിൽനിന്ന്<infl_marker>}
$ablative-ta$ = $ta-forms$ ^-> ([#VowelSigns#] ട [#Virama#] [#inflboundary#]+ __)

$ablative$ = $ablative-cons-vowel$ || $ablative-ta$ || $ablative-virama-chillus$ || $ablative-anuswara$

$tests$ = മഴ<n><RB><ablative> | മുറ്റം<n><RB><ablative> | കിളി<n><RB><ablative> | മഴ<plural>കൾ<EoW><RB><ablative> | കേരളം<n><RB><ablative>
$tests$ || $ablative$ >> "ablative-test.a"

$ablative$
