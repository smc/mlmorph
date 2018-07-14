% --------------------------------------------------------------------------------
% ==== Habitual Aspect Form ====
% The habitual aspect denotes actions which are repeated habitually at a specific time or
% period of time.It is denoted by adding the suffix –aar- to the verb stem followed by the be
% verb untŭ on which the tense is marked.
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
$verb-suffix-map$ = {ുക}:{ാറ്} | {ിക}:{ാറ്}
$habitual-aspect$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <habitual-aspect>)

$habitual-aspect$
