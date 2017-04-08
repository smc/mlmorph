%
% FSTs for nominal Accusative/പ്രതിഗ്രാഹിക inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
% Accusative inflection rules കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ, മരത്തിനെ
$accusative-cons-vowels$ = {<accusative>}:{എ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$accusative-chillus$ = {<accusative>}:{ഇനെ} ^-> ([#Chillus##Virama#] [#POS##BM##Numbers##TMP#]+ __)
$accusative-anuswara1$ = {<accusative>}:{<del>ത്തെ} ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$accusative-anuswara2$ = {<accusative>}:{<del>ത്തിനെ} ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$accusative-anuswara$ = $accusative-anuswara1$ | $accusative-anuswara2$
$accusative-step1$ = $accusative-cons-vowels$ || $accusative-chillus$ || $accusative-anuswara$
$accusative-step2$ ={[#Anuswara#]}:{} ^-> (__ [#POS##BM##Numbers##TMP#]+ <del> )
$accusative$ = $accusative-step1$ || $accusative-step2$
$accusative$
