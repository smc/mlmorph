%
% FSTs for nominal inflections - plurals
%

#include "symbols.fst"

ALPHABET = [#AAsym#]

%%%%% plural
% തലകൾ, തരങ്ങൾ, കാടുകൾ
$plural-cons$ = {<pl>}:{<plural>കൾ} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$plural-anuswara-step1$ = {<pl>}:{<plural>ൾ} ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$plural-virama-step1$ = {<pl>}:{<plural>കൾ} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)
$plural-general$ = $plural-cons$ | $plural-anuswara-step1$ | $plural-virama-step1$

% Post process steps
$plural-anuswara-step2$ = {[#Anuswara#]}:{ങ്ങ} ^-> (__ [#POS##BM##Numbers##TMP#]+ <plural> ൾ )
$plural-virama-step2$ = {[#Virama#]}:{ു} ^-> (__ [#POS##BM##Numbers##TMP#]+ <plural> ക ൾ )

$plural$ = $plural-general$ ||  $plural-anuswara-step2$ || $plural-virama-step2$
% TODO
% 1. Do chillu normalization before plurals so that we can do മാൻ->മാനുകൾ
% 2. മങ്കമാർ, അമ്മമാർ, പോലീസുകാർ...
$plural$
