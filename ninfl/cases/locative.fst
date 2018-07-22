#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <locative> <pl> <del> <dup>

% Locative inflection rules
#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

$anuswara-forms$ = {<locative>}:{<del>ത്തിൽ} | {<locative>}:{<del>ത്തേൽ}  | {<locative>}:{<del>ത്തിങ്കൽ} | {<locative>}:{<del>ത്ത്} | {<locative>}:{<del>ത്തു്}
$locative-anuswara-step1$ = $anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary#]+ __)
$locative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary#]+ <del> )
$locative-anuswara$ = $locative-anuswara-step1$ || $locative-anuswara-step2$

$locative-cons-vowel$ = {<locative>}:{ഇൽ} ^-> ([#Consonants##VowelSigns#] [#inflboundary#]+ __)

$virama-forms$ = {<locative>}:{ഇൽ} | {<locative>}:{ഏൽ} | {<locative>}:{ഇങ്കൽ} | {<locative>}:{അത്ത്} | {<locative>}:{അത്തു്}
$locative-virama-chillus$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#inflboundary#]+ __)

$ta-forms$ = {<locative>}:{<dup>ടിൽ} | {<locative>}:{<dup>ടേൽ} | {<locative>}:{<dup>ടിങ്കൽ} | {<locative>}:{<dup>ടിങ്ങൽ}
$locative-ta$ = $ta-forms$ ^-> ([#VowelSigns#] ട [#Virama#] [#inflboundary#]+ __)

% മറയത്ത്, ഇറയത്ത്,
$exceptions$ = മഴ | മറ | ഇറ | ചിറ

$special_cases$ = ( {<locative>}:{അത്ത്} | {<locative>}:{അത്തു്} ) ^-> ($exceptions$ [#inflboundary#]+ __ )

$locative$ = $special_cases$ | ( $locative-cons-vowel$ || $locative-ta$ || $locative-virama-chillus$ || $locative-anuswara$ )

%$tests$ = മഴ<n><RB><locative> | മുറ്റം<n><RB><locative> | കിളി<n><RB><locative> | മഴ<plural>കൾ<EoW><RB><locative> | കേരളം<n><RB><locative>
%$tests$ || $locative$ >> "locative-test.a"

$locative$
