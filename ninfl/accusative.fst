%
% FSTs for nominal Accusative/പ്രതിഗ്രാഹിക inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
% Accusative inflection rules കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ, മരത്തിനെ
$accusative-special-cases$ = {ഞാൻ}:{എന്നെ} | {താൻ}:{തന്നെ} | {നാം}:{നമ്മെ}
$accusative-anuswara-forms$ = {<accusative>}:{<del>ത്തെ} | {<accusative>}:{<del>ത്തിനെ}

$accusative-exceptions$ = $accusative-special-cases$ ^-> (__ [#POS##BM##Numbers##TMP#]+ <accusative> )
$accusative-cons-vowels$ = {<accusative>}:{എ} ^-> ([#Consonants#ി] [#POS##BM##Numbers##TMP#]+ __)
$accusative-chillus$ = {<accusative>}:{ഇനെ} ^-> ([#Chillus##Virama#] [#POS##BM##Numbers##TMP#]+ __)
$accusative-anuswara$ = $accusative-anuswara-forms$ ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)

$accusative-step1$ = $accusative-cons-vowels$ || \
	$accusative-chillus$ || $accusative-anuswara$

$accusative-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##Numbers##TMP#]+ <del> )
$remove-accusative-ninfl$ = {<accusative>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$accusative$ =  $accusative-exceptions$ || $accusative-step1$ || $accusative-step2$ || $remove-accusative-ninfl$
$accusative$
