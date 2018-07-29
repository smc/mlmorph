
#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

% പിൻവിനയെച്ചം - പൂർണ്ണക്രിയക്ക് പിമ്പ് നടക്കേണ്ട അപൂർണ്ണക്രിയയാണ് പിൻവിനയെച്ചം. ആൻ ആണ് ഇതിനുള്ള പ്രത്യയം.
% ധാതുവിനോട് നേരിട്ടോ ഭാവികാലരൂപത്തോടോ ആൻ പ്രത്യയം ചേർക്കാം.
% ഉദാഹരണം:പഠിക്കാൻ ഇരുന്നു, കളിക്കാൻ പോയി, പാടാൻ പറഞ്ഞു.

$cvb-adv-part-future$ = {ുക}:{ാൻ} <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <cvb-adv-part-future>)

$cvb-adv-part-future$