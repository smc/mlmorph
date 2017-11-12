#include "../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Lsym#] <locative> <pl> <del> <dup>

% Locative inflection rules
#inflboundary# = #POS##BM##TMP##Lsym#

$anuswara-forms$ = {<locative>}:{<del>ത്തിൽ} | {<locative>}:{<del>ത്തിങ്കൽ}
$locative-anuswara-step1$ = $anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary#]+ __)
$locative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary#]+ <del> )
$locative-anuswara$ = $locative-anuswara-step1$ || $locative-anuswara-step2$

$locative-cons-vowel$ = {<locative>}:{ഇൽ} ^-> ([#Consonants##VowelSigns#] [#inflboundary#]+ __)

$virama-forms$ = {<locative>}:{ഇൽ} | {<locative>}:{ഇങ്കൽ}
$locative-virama-chillus$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#inflboundary#]+ __)

$ta-forms$ =  {<locative>}:{<dup>ടിൽ} | {<locative>}:{<dup>ടിങ്കൽ} | {<locative>}:{<dup>ടിങ്ങൽ}
$locative-ta$ = $ta-forms$ ^-> ([#VowelSigns#] ട [#Virama#] [#inflboundary#]+ __)

$locative$ = $locative-cons-vowel$ || $locative-ta$ ||  $locative-virama-chillus$ || $locative-anuswara$ 

%$tests$ = മഴ<n><RB><locative> | മുറ്റം<n><RB><locative> |  കിളി<n><RB><locative> | മഴ<plural>കൾ<EoW><RB><locative> | കേരളം<n><RB><locative> 
%$tests$ || $locative$ >> "locative-test.a"

%TODO വിഭക്ത്യാഭാസം: കാട്ടിലെ, കേരളത്തിൽ, മുറ്റത്ത്, പാടത്ത്, മഴയത്ത്
% See https://ml.wikipedia.org/wiki/വിഭക്ത്യാഭാസം

$locative$