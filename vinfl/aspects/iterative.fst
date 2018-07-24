% --------------------------------------------------------------------------------
% ==== Iterative Aspect Form ====
% An action is viewed as a series of repeated events in the iterative aspect. It is derived
% from the past stem by adding kontu + irikk + tense suffix. It can be in past, present or
% future time.
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

$past-tense$ = "<../adverbs/converb-past.a>"
#iterative-aspects# = <iterative-past-aspect><iterative-present-aspect><iterative-future-aspect> \
	<emphatic-iterative-past-aspect><emphatic-iterative-present-aspect><emphatic-iterative-future-aspect>

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has #perfect-aspects# at end.
$fake-past$ = {<RB>}:{<cvb-adv-part-past>} ^-> ([#verbs#]+ __ [#iterative-aspects#])

$iterative-past-aspect$ = {<iterative-past-aspect>}:{കൊണ്ടിരുന്നു<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )
$iterative-present-aspect$ = {<iterative-present-aspect>}:{കൊണ്ടിരിക്കുന്നു<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )
$iterative-future-aspect$ = {<iterative-future-aspect>}:{കൊണ്ടിരിക്കും<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )
$iterative-aspect$ = $iterative-past-aspect$ || $iterative-present-aspect$ || $iterative-future-aspect$

% --------------------------------------------------------------------------------
% == Emphatic iterative aspect ==
% In this aspect the action is shown as happening without break. Past stem is followed by
% kontu + ee + irikku + tense suffix.

$emphatic-iterative-past-aspect$ = {<emphatic-iterative-past-aspect>}:{കൊണ്ടേയിരുന്നു<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )
$emphatic-iterative-present-aspect$ = {<emphatic-iterative-present-aspect>}:{കൊണ്ടേയിരിക്കുന്നു<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )
$emphatic-iterative-future-aspect$ = {<emphatic-iterative-future-aspect>}:{കൊണ്ടേയിരിക്കും<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )
$emphatic-iterative-aspect$ = $emphatic-iterative-past-aspect$ || $emphatic-iterative-present-aspect$ || $emphatic-iterative-future-aspect$

$fake-past$ || $past-tense$ || ( $iterative-aspect$ | $emphatic-iterative-aspect$ )
