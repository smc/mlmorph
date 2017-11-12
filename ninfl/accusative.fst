%
% FSTs for nominal Accusative/പ്രതിഗ്രാഹിക inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP#] <accusative> <del>

% Accusative inflection rules കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ, മരത്തിനെ
$accusative-special-cases$ = {ഞാൻ}:{എന്നെ<del>} | {താൻ}:{തന്നെ<del>} | {നാം}:{നമ്മെ<del>} | \
	{അവർ}:{അവരെ<del>} | {ഇവൻ}: {ഇവനെ<del>}
$accusative-exceptions-step1$ = $accusative-special-cases$ ^-> (__ [#POS##BM##TMP#]+ <accusative> )
$remove-accusative-ninfl$ = {<accusative>}:{} ^-> (<del> [#POS##BM##TMP#]+ __)
$accusative-exceptions$ = $accusative-exceptions-step1$ || $remove-accusative-ninfl$
$accusative$ = $accusative-exceptions$ 

$accusative-cons-vowels$ = {<accusative>}:{എ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##TMP#]+ __)
$accusative-chillus$ = {<accusative>}:{ഇനെ} ^-> ([#Chillus##Virama#] [#POS##BM##TMP#]+ __)
$accusative$ = $accusative$ || $accusative-cons-vowels$ || $accusative-chillus$

$accusative-anuswara-forms$ = {<accusative>}:{<del>ത്തെ} | {<accusative>}:{<del>ത്തിനെ}
$accusative-anuswara-step1$ = $accusative-anuswara-forms$ ^-> ([#Anuswara#] [#POS##BM##TMP#]+ __)
$accusative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##TMP#]+ <del> )
$accusative-anuswara$ =  $accusative-anuswara-step1$ || $accusative-anuswara-step2$
$accusative$ = $accusative$ ||  $accusative-anuswara$

%$tests$ = മഴ<n><RB><accusative> | മുറ്റം<n><RB><accusative> |  കിളി<n><RB><accusative> | താൻ<prn><RB><accusative>
%$tests$ || $accusative$ >> "accusative-test.a"

$accusative$
