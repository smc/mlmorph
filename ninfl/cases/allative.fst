#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <allative> <pl> <del> <dup>

% Allative inflection rules
#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

$anuswara-forms$ = {<allative>}:{<del>ത്തിലേയ്ക്ക്} | {<allative>}:{<del>ത്തേലേയ്ക്ക്}  | {<allative>}:{<del>ത്തിങ്കലേയ്ക്ക്} | {<allative>}:{<del>ത്തേയ്ക്ക്} |\
	{<allative>}:{<del>ത്തിലോട്ട്} | {<allative>}:{<del>ത്തേലോട്ട്}  | {<allative>}:{<del>ത്തിങ്കലോട്ട്} | {<allative>}:{<del>ത്തോട്ട്}
$allative-anuswara-step1$ = $anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary#]+ __)
$allative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary#]+ <del> )
$allative-anuswara$ = $allative-anuswara-step1$ || $allative-anuswara-step2$

$allative-cons-vowel$ = ( {<allative>}:{ഇലേയ്ക്ക്} | {<allative>}:{ഇലോട്ട്} ) ^-> ([#Consonants##VowelSigns#] [#inflboundary#]+ __)

$virama-forms$ = {<allative>}:{ഇലേയ്ക്ക്} | {<allative>}:{ഏലേയ്ക്ക്} | {<allative>}:{ഇങ്കലേയ്ക്ക്} | {<allative>}:{അത്തേയ്ക്ക്} |\
	{<allative>}:{ഇലോട്ട്} | {<allative>}:{ഏലോട്ട്} | {<allative>}:{ഇങ്കലോട്ട്} | {<allative>}:{അത്തോട്ട്}
$allative-virama-chillus$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#inflboundary#]+ __)

$ta-forms$ = {<allative>}:{<dup>ടിലേയ്ക്ക്} | {<allative>}:{<dup>ടേലേയ്ക്ക്} | {<allative>}:{<dup>ടിങ്കലേയ്ക്ക്} | {<allative>}:{<dup>ടിങ്ങലേയ്ക്ക്} |\
	{<allative>}:{<dup>ടിലോട്ട്} | {<allative>}:{<dup>ടേലോട്ട്} | {<allative>}:{<dup>ടിങ്കലോട്ട്} | {<allative>}:{<dup>ടിങ്ങലോട്ട്}
$allative-ta$ = $ta-forms$ ^-> ([#VowelSigns#] ട [#Virama#] [#inflboundary#]+ __)

$allative$ = $allative-cons-vowel$ || $allative-ta$ || $allative-virama-chillus$ || $allative-anuswara$

%$tests$ = മഴ<n><RB><allative> | മുറ്റം<n><RB><allative> |  കിളി<n><RB><allative> | മഴ<plural>കൾ<EoW><RB><allative> | കേരളം<n><RB><allative>
%$tests$ || $allative$ >> "allative-test.a"

$allative$
