% --------------------------------------------------------------------------------
% ==== Monitory Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

% വീഴുമേ, പാടുമേ, കയറുമേ, തല്ലുമേ, കരയുമേ, പിടിക്കുമേ
$verb-suffix-map$ = {ുക}:{ുമേ}
$monitory-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <monitory-mood>)

$monitory-mood$
