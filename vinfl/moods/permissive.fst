% --------------------------------------------------------------------------------
% ==== Permissive Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]

% The suffix –aam with the dative subject denotes the permissive mood.
% വരാം, സഹായിക്കാം, ഓടാം, പാടാം, പറയാം
$verb-suffix-map$ = {ുക}:{ാം}
$permissive-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <permissive-mood>)
$permissive-mood$
