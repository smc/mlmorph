% --------------------------------------------------------------------------------
% ==== Permissive Mood Forms ====
% അനുജ്ഞായകം - 'ആം അനുഞ്ജായകത്തിനും...' അനുജ്ഞ എന്നു പറയുന്ന സമ്മതത്തിന്റെ മട്ടിലുള്ളത്.
% പ്രകാരപ്രകരണം, കേരളപാണിനീയം.
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]


$past-tense$ = "<../past.a>"

% The suffix –aam with the dative subject denotes the permissive mood.
% വരാം, സഹായിക്കാം, ഓടാം, പാടാം, പറയാം
$verb-suffix-map-1$ = {ുക}:{ാം}

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <permissive-mood> at end.
$fake-past$ = {<RB>}:{<past>} ^-> ([<v>] __ [<permissive-mood>])
$remove-past$ = <past>:<RB> ^-> ([<v>] __ [<permissive-mood>])

% An informal permissive form is derived by adding the suffix –oo to the past tense stem.
% വന്നോ, ചെയ്തോ, പാടിക്കോ, ചാടിക്കോ

$verb-suffix-map-past-1$ = {ു}:{ോ} | {ി<infl_marker>} : {ിക്കോ<infl_marker>}  | {ി<infl_marker>} : {ിയ്ക്കോ<infl_marker>}

% This is the abbreviated form of the past tense + kolluu as in vannukolluu (You may
% come) tannukolluu (You may give) etc. The full forms are rarely used in spoken language now.
% പോയിക്കോളൂ, വന്നോളൂ, ഓടിക്കോളൂ

$verb-suffix-map-past-2$ = {ു<infl_marker>}:{ോളൂ<infl_marker>} | {ി<infl_marker>} : {ിക്കോളൂ<infl_marker>}

% Another suffix which denotes permissive meaning is –ootte added to the past stem.
% The implied meaning of these sentences is that the speaker wishes that the state of affairs
% may continue undisturbed. avan avite irunnootte implies ‘Let him sit there , don’t do
% anything to disturb him or make him go away’.
% പോയിക്കോട്ടെ, വന്നോട്ടെ

$verb-suffix-map-past-3$ = {ു<infl_marker>}:{ോട്ടെ<infl_marker>} | {ി<infl_marker>} : {ിക്കോട്ടെ<infl_marker>}
$verb-suffix-map-past$ = $verb-suffix-map-past-1$ | $verb-suffix-map-past-2$ | $verb-suffix-map-past-3$
$permissive-mood-2$ = $verb-suffix-map-past$ ^-> ([#Consonants#]+ __ [#BM##TMP#<v><past>]+ <permissive-mood>)

% -atte added to the verb root also denotes a meaning similar to the above.
% വരട്ടെ, പറയട്ടെ, ഓടട്ടെ
$verb-suffix-map-2$ = {ുക}:{ട്ടെ}

% An extremely formal permissive form is derived by adding aavunnatŭ + aanŭ to the verb root
% വരാവുന്നതാണ്, പോകാവുന്നതാണ്.

$verb-suffix-map-3$ = {ുക}:{ാവുന്നതാണ്} | {ുക}:{ാവുന്നതാണു്}
$verb-suffix-map$ = $verb-suffix-map-1$ | $verb-suffix-map-2$ | $verb-suffix-map-3$
$permissive-mood-1$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <permissive-mood>)

$permissive-mood$ = $permissive-mood-1$ | \
	( $fake-past$ || $past-tense$ || $permissive-mood-2$ || $remove-past$ )

$permissive-mood$
