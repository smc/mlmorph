%
% FSTs for nominal dative(ഉദ്ദേശിക) inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections - Dative  %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym#] <dative> <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Lsym#

% Dative inflection rules മഴയ്ക്ക്, ഇലയ്ക്ക്, കാടിന്, വീടിന്
$dative-cons-form-1a$ = {<dative>}:{യ്ക്ക്} ^-> ([#Consonants#] [#inflboundary# ]+ __)
$dative-cons-form-1b$ = {<dative>}:{യ്ക്കു്} ^-> ([#Consonants#] [#inflboundary# ]+ __)
$dative-cons-vowel-form-1a$ = {<dative>}:{ക്} ^-> ([#Consonants##VowelSigns#ൾ] [#inflboundary# ]+ __)
$dative-cons-vowel-form-1b$ = {<dative>}:{കു്} ^-> ([#Consonants##VowelSigns#ൾ] [#inflboundary# ]+ __)
$dative-virama-form-1a$ = {<dative>}: {ഇന്} ^-> ([#Virama#] [#inflboundary# ]+ __)
$dative-virama-form-1b$ = {<dative>}: {ഇനു്} ^-> ([#Virama#] [#inflboundary# ]+ __)
$dative-anuswara-form-1$ = {<dative>}: {<del>ത്തിന്} ^-> ([#Anuswara#] [#inflboundary# ]+ __)
$dative-anuswara-form-2$ = {<dative>}: {<del>ത്തിനു്} ^-> ([#Anuswara#] [#inflboundary# ]+ __)

$dative-cons-form$ = $dative-cons-form-1a$ | $dative-cons-form-1b$
$dative-virama-form$ = $dative-virama-form-1a$ | $dative-virama-form-1b$
$dative-cons-vowel-form$ = $dative-cons-vowel-form-1a$ | $dative-cons-vowel-form-1b$

$dative-anuswara-step-1$ = $dative-anuswara-form-1$ | $dative-anuswara-form-2$
$dative-anuswara-step-2$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary# ]+ <del> )
$dative-anuswara$ = $dative-anuswara-step-1$ || $dative-anuswara-step-2$

$dative$ = $dative-cons-form$ | $dative-cons-vowel-form$ | $dative-virama-form$ | $dative-anuswara$

$dative$
