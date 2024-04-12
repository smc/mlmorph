#include "../symbols.fst"


ALPHABET = [#Letters##POS##BM##TMP##infl#]

%%%%%%%% Tenses %%%%%%%%%
#include "past-forms.fst"

$past-tense-ex$ = $past-tense-exceptions$ <>:<infl_marker> ^-> ( __ [#POS##BM##TMP#]+ <past>)
% പറിക്കുക - പറിച്ചു
$past-tense-1$ = {ക്കുക}:{ച്ചു} <>:<infl_marker> ^-> ([#Consonants#]+ [ി] __ [#POS##BM##TMP#]+ <past>)
% അടുക്കുക - അടുത്തു, കൊടുക്കുക- കൊടുത്തു, മൂക്കുക - മൂത്തു
$past-tense-2$ = {ക്കുക}:{ത്തു} <>:<infl_marker> ^-> ([#Consonants#]+ [ുൂ] __ [#POS##BM##TMP#]+ <past>)
% നോക്കുക-നോക്കി, പൊക്കി, ഉടക്കി, കറക്കി,തൂക്കി
$past-tense-3$ = {ക്കുക}:{ക്കി} <>:<infl_marker> ^-> ([#Consonants#] [ാെൊോേൂ]? __ [#POS##BM##TMP#]+ <past>)

% കരയുക - കരഞ്ഞു
% തടവുക - തടവി
% പാടുക - പാടി , ചാടുക - ചാടി
% അകലുക - അകന്നു
% അലറുക - അലറി കുതറുക - കുതറി
% എഴുതുക - എഴുതി
% പിച്ചുക - പിച്ചി
$suffix-forms$ = $past-tense-suffix-map$ <>:<infl_marker> ^-> ([#Letters#]+ __ [#POS##BM##TMP#]+ <past>)

$past-tense$ = $past-tense-ex$ || $suffix-forms$ || $past-tense-1$ || $past-tense-2$ || $past-tense-3$

$past-tense$
