% --------------------------------------------------------------------------------
% ==== Compulsive Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]
$past-tense$ = "<../past.a>"

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <compulsive-mood> at end.
$fake-past$ = <RB>:<past> ^-> ([<v>] __ [<compulsive-mood>])
$remove-past$ = <past>:<RB> ^-> ([<v>] __ [<compulsive-mood>])

$verb-suffix-map$ = {ു}:{േ} | {ി} : {ിയേ}
$compulsive-mood-positive-form$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP#<v><past>]+ <compulsive-mood> )
$compulsive-mood-positive$ = $fake-past$ || $past-tense$ || $compulsive-mood-positive-form$ % || $remove-past$

$verb-suffix-map$ = {ുക}:{ാതെ} | {ിക}:{ാതെ}
$compulsive-mood-negative$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#BM##TMP#<v><past>]+ <compulsive-mood-neg>)

$compulsive-mood-positive$ || $compulsive-mood-negative$
