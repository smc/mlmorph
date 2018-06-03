% --------------------------------------------------------------------------------
% ==== Conditional Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]

$past-tense$ = "<../past.a>"

$conditional-mood-exceptions$ = {പോകുക}:{പോയാൽ}

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <conditional-mood> at end.
$fake-past$ = {<RB>}:{<past>} ^-> ([<v>] __ [<conditional-mood>])
$remove-past$ = <past>:<RB> ^-> ([<v>] __ [<conditional-mood>])

$verb-suffix-map$ = {ു<infl_marker>}:{ാൽ<infl_marker>} | {ി<infl_marker>} : {ിയാൽ<infl_marker>}
$conditional-mood$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP#<v><past>]+ <conditional-mood>)

$conditional-mood-ex$ = $conditional-mood-exceptions$ <>:<infl_marker> ^-> ( __ [#POS##BM##Numbers##TMP#]+ <conditional-mood>)

$conditional-mood-ex$ || ( $fake-past$ || $past-tense$ || $conditional-mood$ || $remove-past$ )

