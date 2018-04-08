#include "../symbols.fst"

ALPHABET = [#AAsym#]

% മുൻവിനയെച്ചം
% പൂർണ്ണക്രിയക്ക് മുമ്പ് നടക്കുന്ന അപൂർണ്ണക്രിയയാണ് മുൻവിനയെച്ചം. ഇതിന് പ്രത്യയമൊന്നും ചേർക്കേണ്ടതില്ല.ഓടിക്കയറി, % ചാടിപ്പോയി എന്നിവ ഉദാഹരണം.
% കുളിക്കുക-> കുളിച്ച് , വരുക-വന്ന് , തരുക-തന്ന്, തളരുക-തളർന്ന്, കരയുക-കരഞ്ഞ്, പാടുക - പാടി, ഇളകുക->ഇളകി

#include "past-forms.fst"
$past-to-cvb-past$ = {ു}:{്} ^-> (__ [<RB>])

$past-tense-suffix-map-wrapped$ = $past-tense-suffix-map$ <>:<RB>
$cvb-adv-part-past-suffix-forms$ = $past-tense-suffix-map-wrapped$ || $past-to-cvb-past$
$cvb-adv-part-past-suffix-1$ = $cvb-adv-part-past-suffix-forms$ <>:<infl_marker> ^-> ([#Consonants##VowelSigns#] __ [#POS##BM##Numbers##TMP#]+ <cvb-adv-part-past>)


% പറിക്കുക - പറിച്ചു
$cvb-adv-part-past-suffix-2$ = {ക്കുക}:{ച്ച[ു]്} <>:<infl_marker> ^-> ([#Consonants#]+ [ി] __ [#POS##BM##Numbers##TMP#]+  <cvb-adv-part-past>)
% അടുക്കുക - അടുത്തു, കൊടുക്കുക- കൊടുത്തു്
$cvb-adv-part-past-suffix-3$ = {ക്കുക}:{ത്ത[ു]്} <>:<infl_marker> ^-> ([#Consonants#]+ [ു] __ [#POS##BM##Numbers##TMP#]+  <cvb-adv-part-past>)
% നോക്കുക-നോക്കി, പൊക്കി, ഉടക്കി, കറക്കി,
$cvb-adv-part-past-suffix-4$ = {ക്കുക}:{ക്കി} <>:<infl_marker> ^-> ([#Consonants#] [ാെൊോേ]? __ [#POS##BM##Numbers##TMP#]+  <cvb-adv-part-past>)


$past-tense-exceptions-wrapped$ = $past-tense-exceptions$ <>:<RB>
$cvb-adv-part-past-special-words$ = $past-tense-exceptions-wrapped$ || $past-to-cvb-past$
$cvb-adv-part-past-special$ = $cvb-adv-part-past-special-words$ <>:<infl_marker> ^-> ( __ [#POS##BM##Numbers##TMP#]+ <cvb-adv-part-past>)

$cvb-adv-part-past$ =  $cvb-adv-part-past-special$ || $cvb-adv-part-past-suffix-1$ || $cvb-adv-part-past-suffix-2$ || $cvb-adv-part-past-suffix-3$ || $cvb-adv-part-past-suffix-4$

$cvb-adv-part-past$
