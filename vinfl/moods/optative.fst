% --------------------------------------------------------------------------------
% ==== Optative Mood Forms ====
% Optative mood forms in Malayalam indicate wish, attitude of no objection and attitude of
% readiness - A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

% വരട്ടെ, പോകട്ടെ, ചെയ്യട്ടെ,
$verb-suffix-map$ = {ുക}:{ട്ടെ}
$optative-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <optative-mood>)
$optative-mood$
