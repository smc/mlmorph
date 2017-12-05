%
% FSTs for nominal Accusative/പ്രതിഗ്രാഹിക inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <accusative> <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

% Accusative inflection rules കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ, മരത്തിനെ
$accusative-special-cases$ = {ഞാൻ}:{എന്നെ<infl_marker>} | {താൻ}:{തന്നെ<infl_marker>} | {നാം}:{നമ്മെ<infl_marker>} | \
	{അവർ}:{അവരെ<infl_marker>} | {ഇവൻ}: {ഇവനെ<infl_marker>}
$accusative-exceptions-step1$ = $accusative-special-cases$ ^-> (__ [#inflboundary#]+ <accusative> )
$remove-accusative-ninfl$ = {<accusative>}:{} ^-> (<infl_marker> [#inflboundary#]+ __)
$accusative-exceptions$ = $accusative-exceptions-step1$ || $remove-accusative-ninfl$
$accusative$ = $accusative-exceptions$

$accusative-cons-vowels-LL$ = {<accusative>}:{എ} ^-> ([#Consonants##VowelSigns#ൾ] [#inflboundary#]+ __)
$accusative-chillus$ = {<accusative>}:{ഇനെ} ^-> ([ർൻൺൿൽ#Virama#] [#inflboundary#]+ __)
$accusative$ = $accusative$ || $accusative-cons-vowels-LL$ || $accusative-chillus$

$accusative-anuswara-forms$ = {<accusative>}:{<del>ത്തെ} | {<accusative>}:{<del>ത്തിനെ}
$accusative-anuswara-step1$ = $accusative-anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary#]+ __)
$accusative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary#]+ <del> )
$accusative-anuswara$ =  $accusative-anuswara-step1$ || $accusative-anuswara-step2$
$accusative$ = $accusative$ || $accusative-anuswara$

%$tests$ = മഴ<n><RB><accusative> | മുറ്റം<n><RB><accusative> |  കിളി<n><RB><accusative> | താൻ<prn><RB><accusative> | ജനങ്ങൾ<del><RB><accusative>
%$tests$ || $accusative$ >> "accusative-test.a"

$accusative$
