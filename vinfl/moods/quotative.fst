% --------------------------------------------------------------------------------
% ==== Quotative Mood Forms ====
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

$past-tense$ = "<../past.a>"

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <quotative-mood> at end.
$fake-past$ = {<RB>}:{<past>} ^-> ([#verbs#]+ __ [<quotative-mood>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<quotative-mood>])

% ചിരിച്ചത്രെ, ചിരിച്ചുവത്രെ
$verb-suffix-map$ = {ു<infl_marker>}:{ത്രേ<infl_marker>} | {ു<infl_marker>}:{ുവത്രേ<infl_marker>} | \
    {ി<infl_marker>}:{ത്രേ<infl_marker>} | {ി<infl_marker>}:{ിയത്രേ<infl_marker>}

$quotative-mood$ = $verb-suffix-map$ ^-> ([#Consonants#]+ __ [#BM##TMP##verbs#<past>]+ <quotative-mood>)

$quotative-mood$ =  $fake-past$ || $past-tense$ || $quotative-mood$ || $remove-past$
$quotative-mood$
