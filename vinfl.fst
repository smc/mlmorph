#include "symbols.fst"


ALPHABET = [#AAsym#]

%%%%%%%% Tenses %%%%%%%%%
$past-tense-map$ = {ക്കുക}:{ക്കി} | {ങ്ങുക}:{ങ്ങി} | {ചുക}:{ചി} | {ഞ്ഞുക}:{ഞ്ഞി} | {ടുക}:{ടി} | {ണ്ണുക}:{ണ്ണി} | \
	{തുക}:{തി} | {ന്നുക}:{ന്നി} | {പുക}:{പി} | {മുക}:{മി} | {യുക}:{ഞ്ഞു} | {വുക}:{വി} | \
	{ലുക}:{ന്നു} | {റുക}:{റി} | {രുക}:{ർന്നു} | {ളുക}:{ളി} | {ശുക}:{ശി} | {ഴുക}:{ണു}
$past-tense-exceptions$ = {ഉണ്ണുക}:{ഉണ്ടു} | \
	{പോവുക}:{പോയി} | \
	{പോകുക}:{പോയി} | \
	{ആവുക}:{ആയി} | \
	{ആകുക}:{ആയി} | \
	{ചാവുക}:{ചത്തു} | \
	{ഇരിക്കുക}:{ഇരുന്നു} |\
	{കാക്കുക}:{കാത്തു} |\
	{തോൽക്കുക}:{തോറ്റു} |\
	{ൾക്കുക}:{ട്ടു}

$past-tense-ex$ = $past-tense-exceptions$ ^-> ( __ [#POS##BM##Numbers##TMP#]+ <past>)
% പറിക്കുക - പറിച്ചു, അടയ്ക്കുക - അടച്ചു
$past-tense-1$ = {ക്കുക}:{ച്ചു} ^-> ([#Consonants#]+ [ി്] __ [#POS##BM##Numbers##TMP#]+ <past>)
% അടുക്കുക - അടുത്തു, കൊടുക്കുക- കൊടുത്തു
$past-tense-2$ = {ക്കുക}:{ത്തു} ^-> ([#Consonants#]+ [ു] __ [#POS##BM##Numbers##TMP#]+ <past>)
% കരയുക - കരഞ്ഞു
% തടവുക - തടവി
% പാടുക - പാടി , ചാടുക - ചാടി
% അകലുക - അകന്നു
% അലറുക - അലറി കുതറുക - കുതറി
% എഴുതുക - എഴുതി
% പിച്ചുക - പിച്ചി
$past-tense-3$ = $past-tense-map$ ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)

$remove-past-vinfl$ = {<past>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$past-tense$ = $past-tense-ex$ || $past-tense-1$ || $past-tense-2$ || $past-tense-3$  \
	|| $remove-past-vinfl$

% അടിക്കുക - അടിക്കും അടുക്കുക - അടുക്കും, കാക്കുക - കാക്കും കരയുക - കരയും തകർക്കുക - തകർക്കും
% തകരുക - തകരും
$future-tense-1$ = {ുക}:{ും} ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <future>)

$future-tense$ = $future-tense-1$
% അടിക്കുക - അടിക്കുന്നു. കരയുക - കരയുന്നു.
$present-tense-1$ = {ുക}:{ുന്നു} ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <present>)

$present-tense$ = $present-tense-1$
$tenses$ = $past-tense$ || $present-tense$ || $future-tense$

%%%% Converbs %%%%%%%%%%
% വിനയെച്ചം - Adverbial participle
% മുൻവിനയെച്ചം
% പൂർണ്ണക്രിയക്ക് മുമ്പ് നടക്കുന്ന അപൂർണ്ണക്രിയയാണ് മുൻവിനയെച്ചം. ഇതിന് പ്രത്യയമൊന്നും ചേർക്കേണ്ടതില്ല.ഓടിക്കയറി, % ചാടിപ്പോയി എന്നിവ ഉദാഹരണം.
% പിൻവിനയെച്ചം - പൂർണ്ണക്രിയക്ക് പിമ്പ് നടക്കേണ്ട അപൂർണ്ണക്രിയയാണ് പിൻവിനയെച്ചം. ആൻ ആണ് ഇതിനുള്ള പ്രത്യയം.
% ധാതുവിനോട് നേരിട്ടോ ഭാവികാലരൂപത്തോടോ ആൻ പ്രത്യയം ചേർക്കാം.
% ഉദാഹരണം:പഠിക്കാൻ ഇരുന്നു, കളിക്കാൻ പോയി, പാടാൻ പറഞ്ഞു.

$cvb-adv-part-future$ =  {ുക}:{ാൻ} ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+  <cvb-adv-part-future>)
$removable-vinfl-forms$ =  {[#vinfl#]}:{}

% നടുവിനയെച്ചം Absolute verb
% കാലം,പ്രകാരം, പുരുഷൻ ഇത്യാദി ഉപാധികളൊന്നുമില്ലാതെ കേവലമായ ക്രിയയെയാണ് നടുവിനയെച്ചം കുറിക്കുന്നത്.
% ക, അ, ഉക എന്നിവയാണ് പ്രത്യയങ്ങൾ. ഉക എല്ലാ ധാതുക്കളോടും ചേർക്കാം.
% എന്നാൽ അ, ക എന്നിവ എല്ലാ ധാതുക്കളോടും ചേർക്കാറില്ല. പറ, പറക, പറയുക എന്നിവയാണ് നടുവിനയെച്ച രൂപങ്ങൾ.
$cvb-adv-part-absolute-forms$ = {ുക}:{} | {യ്യുക}:{യ്} | {ക്കുക}:{}
$cvb-adv-part-absolute$ = $cvb-adv-part-absolute-forms$ ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <cvb-adv-part-absolute>)
% പാക്ഷിക വിനയെച്ചം
% പൂർണ്ണക്രിയ നടക്കണമെങ്കിൽ നടക്കേണ്ട അപൂർണ്ണക്രിയയാണ് പാക്ഷിക വിനയെച്ചം.
% ആൽ, ഇൽ, ആകിൽ, എങ്കിൽ എന്നിവയാണ് പ്രത്യയങ്ങൾ.
$cvb-adv-part-conditional-forms$ = {ുക}:{ിൽ} | {ുക}:{യാൽ} | {ുക}:{യാകിൽ} | {ുക}:{യെങ്കിൽ}
$cvb-adv-part-conditional$ = $cvb-adv-part-conditional-forms$ ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <cvb-adv-part-conditional>)
$adverbs$ = $cvb-adv-part-future$ || \
	%$cvb-adv-part-absolute$ || \
	$cvb-adv-part-conditional$

$remove-vinfl$ = $removable-vinfl-forms$ ^-> ([#POS##BM##Numbers##TMP#]+ __)
$tests$ = അറിയിക്കുക<v><RB><past>
%$tests$ || \
$vinfl$ = $tenses$ || $adverbs$ || $remove-vinfl$
$vinfl$
