#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

% മുൻവിനയെച്ചം
% പൂർണ്ണക്രിയക്ക് മുമ്പ് നടക്കുന്ന അപൂർണ്ണക്രിയയാണ് മുൻവിനയെച്ചം. ഇതിന് പ്രത്യയമൊന്നും ചേർക്കേണ്ടതില്ല.ഓടിക്കയറി, % ചാടിപ്പോയി എന്നിവ ഉദാഹരണം.
% കുളിക്കുക-> കുളിച്ച് , വരുക-വന്ന് , തരുക-തന്ന്, തളരുക-തളർന്ന്, കരയുക-കരഞ്ഞ്, പാടുക - പാടി, ഇളകുക->ഇളകി

$past-tense$ = "<../past.a>"

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <adv-clause-rp-past> at end.
$fake-past$ = <RB>:<past> ^-> ([#verbs#]+ __ [<cvb-adv-part-past><cvb-adv-part-past-simul>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<cvb-adv-part-past><cvb-adv-part-past-simul>])

$verb-suffix-map$ = {ു}:{്} | {ു}:{ു്}

$cvb-adv-part-past-form$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#<past>]+ <cvb-adv-part-past> )

$verb-suffix-map$ = {ു<infl_marker>}:{പ്പോൾ<infl_marker>} | {ി<infl_marker>}:{ിയപ്പോൾ<infl_marker>}
% NOTE: The <infl_marker> in above line is important to avoid multiple repeated results in generation output.

$cvb-adv-part-past-simul-form$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <cvb-adv-part-past-simul> )

$cvb-adv-part-past$ = $fake-past$ || $past-tense$ || $remove-past$ ||  ($cvb-adv-part-past-form$ || $cvb-adv-part-past-simul-form$)

$cvb-adv-part-past$

