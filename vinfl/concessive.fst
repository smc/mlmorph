#include "../symbols.fst"

% ഉദാഹരണം: പോവുക - പോയാലും, പാടുക - പാടിയാലും , ചാടുക - ചാടിയാലും , തരിക-തന്നാലും
% കരയും - കരഞ്ഞാലും കുളിക്കുക - കുളിച്ചാലും

ALPHABET = [#Letters##POS##BM##TMP##infl#]

%%%% Concessives അനുവാദകങ്ങൾ %%%%%%%%%

$past-tense$ = "<past.a>"

$concessive-exceptions$ = {പോകുക}:{പോയാലും}

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <concessive> at end.
$fake-past$ = <RB>:<past> ^-> ([#verbs#]+ __ [<concessive>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<concessive>])

$verb-suffix-map$ = {ു<infl_marker>}:{ാലും<infl_marker>} | \
	{ി<infl_marker>} :{യാലും<infl_marker>}
% The <infl_marker> in above line has no functional effecet. But without that 3 duplicate results
% are generated. 3 is the length of ിയേ. I have not figured out the reason.

$concessive-form$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP##verbs#]+ <concessive> )
$concessive$ = $fake-past$ || $past-tense$ || $remove-past$ || $concessive-form$

$concessive-ex$ = $concessive-exceptions$ <>:<infl_marker> ^-> ( __ [#POS##BM##TMP#]+ <concessive>)

$concessive-ex$ || $concessive$
