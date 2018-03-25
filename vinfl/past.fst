#include "../symbols.fst"


ALPHABET = [#AAsym#]

%%%%%%%% Tenses %%%%%%%%%
#include "past-forms.fst"

$past-tense-ex$ = $past-tense-exceptions$ <>:<infl_marker> ^-> ( __ [#POS##BM##Numbers##TMP#]+ <past>)
% പറിക്കുക - പറിച്ചു, അടയ്ക്കുക - അടച്ചു
$past-tense-1$ = {ക്കുക}:{ച്ചു} <>:<infl_marker> ^-> ([#Consonants#]+ [ി്] __ [#POS##BM##Numbers##TMP#]+ <past>)
% അടുക്കുക - അടുത്തു, കൊടുക്കുക- കൊടുത്തു
$past-tense-2$ = {ക്കുക}:{ത്തു} <>:<infl_marker> ^-> ([#Consonants#]+ [ു] __ [#POS##BM##Numbers##TMP#]+ <past>)
% കരയുക - കരഞ്ഞു
% തടവുക - തടവി
% പാടുക - പാടി , ചാടുക - ചാടി
% അകലുക - അകന്നു
% അലറുക - അലറി കുതറുക - കുതറി
% എഴുതുക - എഴുതി
% പിച്ചുക - പിച്ചി
$past-tense-3$ = $past-tense-suffix-map$  <>:<infl_marker> ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)

$past-tense$ = $past-tense-ex$ || $past-tense-1$ || $past-tense-2$ || $past-tense-3$

$past-tense$
