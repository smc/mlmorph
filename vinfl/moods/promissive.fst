% --------------------------------------------------------------------------------
% ==== Promissive Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]

% വരാം, സഹായിക്കാം, ഓടാം, പാടാം, പറയാം
$verb-suffix-map$ = {ുക}:{ാം}
$promissive-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <promissive-mood>)

% A stronger degree of promise is indicated by the suffix –eek + -aam added to the past
% tense stem of the verb. വന്നേക്കാം, പോയേക്കാം

% Similar in force are the constructions using –ool + -aam with the past tense stem.
% പോയിക്കോളാം, വന്നോളാം, ഓടിക്കോളാം

% Meaning of certainty is conveyed through the suffix –irikk + -um added to the past tense
% stem. പോയിരിക്കും, വന്നിരിക്കും

$promissive-mood$
