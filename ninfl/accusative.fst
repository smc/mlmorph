%
% FSTs for nominal Accusative inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
% Accusative inflection rules കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ
$accusative-cons-vowels$ = {<accusative>}:{എ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$accusative-chillus$ = {<accusative>}:{ഇനെ} ^-> ([#Chillus##Virama#] [#POS##BM##Numbers##TMP#]+ __)
$accusative$ = $accusative-cons-vowels$ || $accusative-chillus$
$accusative$
