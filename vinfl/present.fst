#include "../symbols.fst"


ALPHABET = [#AAsym#]

% അടിക്കുക - അടിക്കുന്നു. കരയുക - കരയുന്നു.
$present-tense-1$ = {ുക}:{ുന്നു} ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <present>)

$present-tense$ = $present-tense-1$

$present-tense$ 