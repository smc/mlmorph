#include "../symbols.fst"


ALPHABET = [#AAsym#]

% അടിക്കുക - അടിക്കും അടുക്കുക - അടുക്കും, കാക്കുക - കാക്കും കരയുക - കരയും തകർക്കുക - തകർക്കും
% തകരുക - തകരും
$future-tense-1$ = {ുക}:{ും} ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <future>)

$future-tense$ = $future-tense-1$

$future-tense$