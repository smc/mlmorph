% --------------------------------------------------------------------------------
% ==== Monitory Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]

% വീഴുമേ, പാടുമേ, കയറുമേ, തല്ലുമേ, കരയുമേ, പിടിക്കുമേ
$verb-suffix-map$ = {ുക}:{ുമേ}
$monitory-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <monitory-mood>)

$monitory-mood$