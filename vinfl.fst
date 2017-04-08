#include "symbols.fst"


ALPHABET = [#AAsym#]

% പറിക്കുക - പറിച്ചു, അടക്കുക - അടച്ചു
$past-tense-1$ = {ക്കുക}:{ച്ചു} ^-> ([#Consonants#]+ [ി]* __ [#POS##BM##Numbers##TMP#]+ <past>)
% അടുക്കുക - അടുത്തു, കാക്കുക - കാത്തു
$past-tense-2$ = {ക്കുക}:{ത്തു} ^-> ([#Consonants#]+ [ുോ]  __ [#POS##BM##Numbers##TMP#]+ <past>)
% കരയുക - കരഞ്ഞു
$past-tense-3$ = {യുക}:{ഞ്ഞു} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% തടവുക - തടവി
$past-tense-4$ = {വുക}:{വി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% പാടുക - പാടി , ചാടുക - ചാടി
$past-tense-5$ = {ടുക}:{ടി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% അകലുക - അകന്നു
$past-tense-6$ = {ലുക}:{ന്നു} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% അലറുക - അലറി  കുതറുക - കുതറി
$past-tense-7$ = {റുക}:{റി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% എഴുതുക - എഴുതി
$past-tense-8$ = {തുക}:{തി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% തുപ്പുക - തുപ്പി
$past-tense-9$ = {പുക}:{പി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% പിച്ചുക - പിച്ചി
$past-tense-10$ = {ചുക}:{ചി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
% More - പോവുക/പോകുക , ആവുക/ആകുക?

$remove-past-vinfl$ = {<past>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$past-tense$ = $past-tense-1$ || $past-tense-2$ || $past-tense-3$ \
	|| $past-tense-4$ || $past-tense-5$ || $past-tense-6$ || $past-tense-7$ \
	|| $past-tense-8$ || $past-tense-9$ || $past-tense-10$ || $remove-past-vinfl$

% അടിക്കുക - അടിക്കും  അടുക്കുക - അടുക്കും, കാക്കുക - കാക്കും കരയുക - കരയും തകർക്കുക - തകർക്കും
% തകരുക - തകരും
$future-tense-1$ = {ുക}:{ും} ^-> ([#Consonants#]+  __ [#POS##BM##Numbers##TMP#]+ <future>)
$remove-future-vinfl$ = {<future>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$future-tense$ = $future-tense-1$ || $remove-future-vinfl$
% അടിക്കുക - അടിക്കുന്നു. കരയുക - കരയുന്നു.
$present-tense-1$ =  {ുക}:{ുന്നു} ^-> ([#Consonants#]+  __ [#POS##BM##Numbers##TMP#]+ <present>)
$remove-present-vinfl$ = {<present>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$present-tense$  = $present-tense-1$ || $remove-present-vinfl$
$tenses$ = $past-tense$ || $present-tense$ || $future-tense$
$tests$ = അറിയിക്കുക<v><RB><past>

%$tests$ || \
$tenses$ || .*
