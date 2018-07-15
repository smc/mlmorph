% --------------------------------------------------------------------------------
% ==== Irrealis Mood Forms ====
% The irrealis mood is conveyed by past stem + -eene following a conditional clause.
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

$past-tense$ = "<../past.a>"

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <irrealis-mood> at end.
$fake-past$ = {<RB>}:{<past>} ^-> ([#verbs#]+ __ [<irrealis-mood>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<irrealis-mood>])

$verb-suffix-map$ = {ു<infl_marker>}:{േനെ<infl_marker>} | {ി<infl_marker>} : {േനെ<infl_marker>}
$irrealis-mood$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP##verbs#<past>]+ <irrealis-mood>)

$fake-past$ || $past-tense$ || $irrealis-mood$ || $remove-past$
