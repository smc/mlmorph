% --------------------------------------------------------------------------------
% ==== Abilitative Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]

% വരാവുന്നതേ, പോകാവുന്നതേ
$verb-suffix-map$ = {ുക}:{ാവുന്നതേ}
$abilitative-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <abilitative-mood>)

$abilitative-mood$
