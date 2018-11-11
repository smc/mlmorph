% --------------------------------------------------------------------------------
% ==== Iterative Aspect Form ====
% An action is viewed as a series of repeated events in the iterative aspect. It is derived
% from the past stem by adding kontu + irikk + tense suffix. It can be in past, present or
% future time.
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

$converb-past$ = "<../adverbs/converb-past.a>"
#iterative-aspects# = <iterative-aspect><iterative-past-aspect><iterative-present-aspect><iterative-future-aspect> \
	<emphatic-iterative-past-aspect><emphatic-iterative-present-aspect><emphatic-iterative-future-aspect>

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has #iterative-aspects# at end.

% NOTE: The reason for retaining <RB> below is, it is required for $fake-past$ in converb-past.fst
$fake-converb-past$ = {<RB>}:{<RB><cvb-adv-part-past>} ^-> ([#verbs#]+ __ [#iterative-aspects#])
$remove-converb-past$ = <cvb-adv-part-past>:<RB> ^-> ([#verbs#]+ __ [#iterative-aspects#])

$iterative-aspect$ = {<iterative-aspect>}:{കൊണ്ടിരിക്കുക<infl_marker>} ^-> ([#POS##BM##TMP#<cvb-adv-part-past>]+ __ )
$iterative-past-aspect$ = {<iterative-past-aspect>}:{കൊണ്ടിരുന്നു<infl_marker>} ^-> ([#POS##BM##TMP#<cvb-adv-part-past>]+ __ )
$iterative-present-aspect$ = {<iterative-present-aspect>}:{കൊണ്ടിരിക്കുന്നു<infl_marker>} ^-> ([#POS##BM##TMP#<cvb-adv-part-past>]+ __ )
$iterative-future-aspect$ = {<iterative-future-aspect>}:{കൊണ്ടിരിക്കും<infl_marker>} ^-> ([#POS##BM##TMP#<cvb-adv-part-past>]+ __ )
$iterative-aspect$ = $iterative-aspect$ || $iterative-past-aspect$ || $iterative-present-aspect$ || $iterative-future-aspect$

% --------------------------------------------------------------------------------
% == Emphatic iterative aspect ==
% In this aspect the action is shown as happening without break. Past stem is followed by
% kontu + ee + irikku + tense suffix.

$emphatic-iterative-past-aspect$ = {<emphatic-iterative-past-aspect>}:{കൊണ്ടേയിരുന്നു<infl_marker>} ^-> ([#POS##BM##TMP#<cvb-adv-part-past>]+ __ )
$emphatic-iterative-present-aspect$ = {<emphatic-iterative-present-aspect>}:{കൊണ്ടേയിരിക്കുന്നു<infl_marker>} ^-> ([#POS##BM##TMP#<cvb-adv-part-past>]+ __ )
$emphatic-iterative-future-aspect$ = {<emphatic-iterative-future-aspect>}:{കൊണ്ടേയിരിക്കും<infl_marker>} ^-> ([#POS##BM##TMP#<cvb-adv-part-past>]+ __ )
$emphatic-iterative-aspect$ = $emphatic-iterative-past-aspect$ || $emphatic-iterative-present-aspect$ || $emphatic-iterative-future-aspect$

$iterative$ = $fake-converb-past$ || $converb-past$|| ( $iterative-aspect$ || $emphatic-iterative-aspect$ ) || $remove-converb-past$

% $test$ = പഠിക്കുക<v><RB><iterative-past-aspect>
% $test$ || $iterative$ >> "iterative-test.a"

$iterative$