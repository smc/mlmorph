#include "../symbols.fst"

ALPHABET = [#AAsym#]
% Locative inflection rules
$locative$ = {<locative>}:{ഇൽ} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$locative$
