#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <locative> <pl> <del> <dup>

% Locative inflection rules
#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

$anuswara-forms$ = {<locative>}:{<del>ത്തിൽ<infl_marker>} | {<locative>}:{<del>ത്തേൽ<infl_marker>}  |\
	{<locative>}:{<del>ത്തിങ്കൽ<infl_marker>}\
	| {<locative>}:{<del>ത്ത്<infl_marker>} | {<locative>}:{<del>ത്തു്<infl_marker>} | {<locative>}:{<del>ത്തു<infl_marker>}
$locative-anuswara-step1$ = $anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary#]+ __)
$locative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary#]+ <del> )
$locative-anuswara$ = $locative-anuswara-step1$ || $locative-anuswara-step2$

$locative-cons-vowel$ = {<locative>}:{ഇൽ<infl_marker>} ^-> ([#Consonants##VowelSigns#] [#inflboundary#]+ __)

$virama-forms$ = {<locative>}:{ഇൽ<infl_marker>} | {<locative>}:{ഏൽ<infl_marker>} | {<locative>}:{ഇങ്കൽ<infl_marker>} \
	| {<locative>}:{അത്ത്<infl_marker>} | {<locative>}:{അത്തു്<infl_marker>} | {<locative>}:{അത്തു<infl_marker>}
$locative-virama-chillus$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#inflboundary#]+ __)

$ta-forms$ = {<locative>}:{<dup>ടിൽ<infl_marker>} | {<locative>}:{<dup>ടേൽ<infl_marker>} \
	| {<locative>}:{<dup>ടിങ്കൽ} | {<locative>}:{<dup>ടിങ്ങൽ}
$locative-ta$ = $ta-forms$ ^-> ([#VowelSigns#] ട [#Virama#] [#inflboundary#]+ __)

% മറയത്ത്, ഇറയത്ത്,
$exceptions$ = മഴ | മറ | ഇറ | ചിറ

$special_cases$ = ( {<locative>}:{അത്ത്<infl_marker>} | {<locative>}:{അത്തു്<infl_marker>} | {<locative>}:{അത്തു<infl_marker>} ) ^-> ($exceptions$ [#inflboundary#]+ __ )

$locative$ = $special_cases$ | ( $locative-cons-vowel$ || $locative-ta$ || $locative-virama-chillus$ || $locative-anuswara$ )

%$tests$ = മഴ<n><RB><locative> | മുറ്റം<n><RB><locative> | കിളി<n><RB><locative> | മഴ<plural>കൾ<EoW><RB><locative> | കേരളം<n><RB><locative>
%$tests$ || $locative$ >> "locative-test.a"

$locative$
