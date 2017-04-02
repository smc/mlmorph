%
% FSTs for nominal dative inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
% Dative inflection rules മഴയ്ക്ക്, ഇലയ്ക്ക്, കാടിന്, വീടിന്
$dative-cons-form-1a$ = {<dative>}:{യ്ക്ക്} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$dative-cons-form-1b$ = {<dative>}:{യ്ക്കു്} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$dative-cons-vowel-form-1a$ = {<dative>}:{<ninfl>ക്ക്} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$dative-cons-vowel-form-1b$ = {<dative>}:{<ninfl>ക്കു്} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$dative-virama-form-1a$ = {<dative>}: {ഇന്} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)
$dative-virama-form-1b$ = {<dative>}: {ഇനു്} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)
$dative$ = $dative-cons-form-1a$ || $dative-cons-form-1b$ \
	|| $dative-cons-vowel-form-1a$ || $dative-cons-vowel-form-1b$ \
	|| $dative-virama-form-1a$ || $dative-virama-form-1b$

$dative$
