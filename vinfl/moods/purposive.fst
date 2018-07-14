% --------------------------------------------------------------------------------
% ==== Purposive Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

% വരാൻ, പോകാൻ, പാടാൻ
$verb-suffix-map$ = {ുക}:{ാൻ}
$purposive-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <purposive-mood>)

$purposive-mood$
