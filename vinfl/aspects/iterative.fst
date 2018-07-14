% --------------------------------------------------------------------------------
% ==== Iterative Aspect Form ====
% An action is viewed as a series of repeated events in the iterative aspect. It is derived
% from the past stem by adding kontu + irikk + tense suffix. It can be in past, present or
% future time.
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

$past-tense$ = "<../converb-past.a>"
#iterative-aspects# = <iterative-aspect><emphatic-iterative-aspect>
% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has #perfect-aspects# at end.
$fake-past$ = {<RB>}:{<cvb-adv-part-past>} ^-> ([<v>] __ [#iterative-aspects#])

$iterative-aspect$ = {<iterative-aspect>}:{കൊണ്ടിരുന്നു<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )

% --------------------------------------------------------------------------------
% == Emphatic iterative aspect ==
% In this aspect the action is shown as happening without break. Past stem is followed by
% kontu + ee + irikku + tense suffix.

$emphatic-iterative-aspect$ = {<emphatic-iterative-aspect>}:{കൊണ്ടേയിരുന്നു<infl_marker>} ^-> ([<cvb-adv-part-past>] __ )

$fake-past$ || $past-tense$ || ( $iterative-aspect$ | $emphatic-iterative-aspect$ )
