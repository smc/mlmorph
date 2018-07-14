#include "../symbols.fst"


ALPHABET = [#Letters##POS##BM##TMP##infl#]

% അടിക്കുക - അടിക്കും അടുക്കുക - അടുക്കും, കാക്കുക - കാക്കും കരയുക - കരയും തകർക്കുക - തകർക്കും
% തകരുക - തകരും
$future-tense-1$ = {ുക}:{ും} <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <future>)

$future-tense$ = $future-tense-1$

$future-tense$
