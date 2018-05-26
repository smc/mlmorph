% --------------------------------------------------------------------------------
% ==== Permissive Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]


$past-tense$ = "<../past.a>"

% The suffix –aam with the dative subject denotes the permissive mood.
% വരാം, സഹായിക്കാം, ഓടാം, പാടാം, പറയാം
$verb-suffix-map$ = {ുക}:{ാം}
$permissive-mood-1$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <permissive-mood>)

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <permissive-mood> at end.
$fake-past$ = {<RB>}:{<past>} ^-> ([<v>] __ [<permissive-mood>])
$remove-past$ = <past>:<RB> ^-> ([<v>] __ [<permissive-mood>])

% An informal permissive form is derived by adding the suffix –oo to the past tense stem.
% വന്നോ, ചെയ്തോ, പാടിക്കോ, ചാടിക്കോ

$verb-suffix-map$ = {ു}:{ോ} | {ി<infl_marker>} : {ിക്കോ<infl_marker>}  | {ി<infl_marker>} : {ിയ്ക്കോ<infl_marker>}
$permissive-mood-2$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP#<v><past>]+ <permissive-mood>)

% This is the abbreviated form of the past tense + kolluu as in vannukolluu (You may
% come) tannukolluu (You may give) etc. The full forms are rarely used in spoken language now.
% പോയിക്കോളൂ, വന്നോളൂ, ഓടിക്കോളൂ

$verb-suffix-map$ = {ു}:{ോളൂ} | {ി<infl_marker>} : {ിക്കോളൂ<infl_marker>}
$permissive-mood-3$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP#<v><past>]+ <permissive-mood>)

% Another suffix which denotes permissive meaning is –ootte added to the past stem.
% The implied meaning of these sentences is that the speaker wishes that the state of affairs
% may continue undisturbed. avan avite irunnootte implies ‘Let him sit there , don’t do
% anything to disturb him or make him go away’.
% പോയിക്കോട്ടെ, വന്നോട്ടെ

$verb-suffix-map$ = {ു}:{ോട്ടെ} | {ി<infl_marker>} : {ിക്കോട്ടെ<infl_marker>}
$permissive-mood-4$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP#<v><past>]+ <permissive-mood>)

% -atte added to the verb root also denotes a meaning similar to the above.
% വരട്ടെ, പറയട്ടെ, ഓടട്ടെ
$verb-suffix-map$ = {ുക}:{ട്ടെ}
$permissive-mood-5$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <permissive-mood>)

% An extremely formal permissive form is derived by adding aavunnatŭ + aanŭ to the verb root
% വരാവുന്നതാണ്, പോകാവുന്നതാണ്.

$verb-suffix-map$ = {ുക}:{ാവുന്നതാണ്} | {ുക}:{ാവുന്നതാണു്}
$permissive-mood-6$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <permissive-mood>)

$permissive-mood$ = $permissive-mood-1$ | \
	( $fake-past$ || $past-tense$ || ( $permissive-mood-2$ | $permissive-mood-3$ | $permissive-mood-4$ ) || $remove-past$ ) | \
	$permissive-mood-5$ | $permissive-mood-6$

$permissive-mood$
