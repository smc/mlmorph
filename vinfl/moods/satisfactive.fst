% --------------------------------------------------------------------------------
% ==== Satisfactive Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]
$past-tense$ = "<../past.a>"
$satisfactive-mood-exceptions$ = {പോകുക}:{പോയല്ലോ}

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <satisfactive-mood> at end.
$fake-past$ = <RB>:<past> ^-> ([#verbs#]+ __ [<satisfactive-mood>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<satisfactive-mood>])

$verb-suffix-map$ = {ു<infl_marker>}:{ല്ലോ<infl_marker>} |  {ു<infl_marker>}:{ുവല്ലോ<infl_marker>} | \
	{ി<infl_marker>} : {ിയല്ലോ<infl_marker>}

$satisfactive-mood-form$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP##verbs#<past>]+ <satisfactive-mood> )
$satisfactive-mood$ = $fake-past$ || $past-tense$ || $satisfactive-mood-form$ || $remove-past$
$satisfactive-mood-ex$ = $satisfactive-mood-exceptions$ <>:<infl_marker> ^-> ( __ [#POS##BM##TMP#]+ <satisfactive-mood>)

$satisfactive-mood-ex$ || $satisfactive-mood$
