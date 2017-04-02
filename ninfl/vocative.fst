#include "../symbols.fst"

ALPHABET = [#AAsym#]
% Vocative inflection rules- sambodhana - മരമേ, കാടേ, പൂച്ചേ, അവരേ, അവളേ, മലരേ, പട്ടികളേ, പട്ടീ
$vocative$ = {<vocative>}:{ഏ} ^-> ([#POS##BM##Numbers##TMP#]* __)
$vocative$
