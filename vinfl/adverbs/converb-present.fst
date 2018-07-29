#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
%%%% Converbs %%%%%%%%%%
% നടുവിനയെച്ചം

% നടുവിനയെച്ചം Absolute verb
% കാലം,പ്രകാരം, പുരുഷൻ ഇത്യാദി ഉപാധികളൊന്നുമില്ലാതെ കേവലമായ ക്രിയയെയാണ് നടുവിനയെച്ചം കുറിക്കുന്നത്.
% ക, അ, ഉക എന്നിവയാണ് പ്രത്യയങ്ങൾ. ഉക എല്ലാ ധാതുക്കളോടും ചേർക്കാം.
% എന്നാൽ അ, ക എന്നിവ എല്ലാ ധാതുക്കളോടും ചേർക്കാറില്ല. പറ, പറക, പറയുക എന്നിവയാണ് നടുവിനയെച്ച രൂപങ്ങൾ.

$cvb-adv-part-absolute-forms$ = {യുക}:{യ} | {യ്യുക}:{യ്} | {യ്യുക}:{യ്യൽ} | {കുക} : {ക} | {ടുക}:{ട}
$cvb-adv-part-absolute$ = $cvb-adv-part-absolute-forms$ <>:<infl_marker> ^-> ([#Letters#]+ __ [#POS##BM##TMP#]+ <cvb-adv-part-absolute>)

% പാക്ഷിക വിനയെച്ചം
% പൂർണ്ണക്രിയ നടക്കണമെങ്കിൽ നടക്കേണ്ട അപൂർണ്ണക്രിയയാണ് പാക്ഷിക വിനയെച്ചം.
% ആൽ, ഇൽ, ആകിൽ, എങ്കിൽ എന്നിവയാണ് പ്രത്യയങ്ങൾ.

$cvb-adv-part-conditional-forms$ = {ുക}:{ിൽ} | {ുക}:{യാൽ} | {ുക}:{യാകിൽ} | {ുക}:{യെങ്കിൽ}
$cvb-adv-part-conditional$ = $cvb-adv-part-conditional-forms$ <>:<infl_marker> ^-> ([#Letters#]+ __ [#POS##BM##TMP#]+ <cvb-adv-part-conditional>)


% Simultaneous infinitive - കേൾക്കവേ, പറയവേ, ഓടവേ, ഓടുമ്പോൾ
$cvb-adv-part-simul-forms$ = {ുക}:{വേ}
$cvb-adv-part-simul$ = $cvb-adv-part-simul-forms$ <>:<infl_marker> ^-> ([#Letters#]+ __ [#POS##BM##TMP#]+ <cvb-adv-part-simul>)

$converbs$ = $cvb-adv-part-absolute$ || \
	$cvb-adv-part-conditional$ || \
	$cvb-adv-part-simul$

$converbs$
