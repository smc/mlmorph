#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

% മുൻവിനയെച്ചം
% പൂർണ്ണക്രിയക്ക് മുമ്പ് നടക്കുന്ന അപൂർണ്ണക്രിയയാണ് മുൻവിനയെച്ചം. ഇതിന് പ്രത്യയമൊന്നും ചേർക്കേണ്ടതില്ല.ഓടിക്കയറി, % ചാടിപ്പോയി എന്നിവ ഉദാഹരണം.
% കുളിക്കുക-> കുളിച്ച് , വരുക-വന്ന് , തരുക-തന്ന്, തളരുക-തളർന്ന്, കരയുക-കരഞ്ഞ്, പാടുക - പാടി, ഇളകുക->ഇളകി

$past-tense$ = "<../past.a>"

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <adv-clause-rp-past> at end.
$fake-past$ = <RB>:<past> ^-> ([#verbs#]+ __ [<cvb-adv-part-past>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<cvb-adv-part-past>])

$verb-suffix-map$ = {ു}:{്} | {ു}:{ു്}

$cvb-adv-part-past-form$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#<past>]+ <cvb-adv-part-past> )
$cvb-adv-part-past$ = $fake-past$ || $past-tense$ || $cvb-adv-part-past-form$ || $remove-past$

$cvb-adv-part-past$

