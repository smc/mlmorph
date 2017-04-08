#include "symbols.fst"


ALPHABET = [#AAsym#]

$past-tense-1$ = {ക്കുക}:{ച്ചു} ^-> ([#Consonants#]+ [ി]* __ [#POS##BM##Numbers##TMP#]+ <past>)
$past-tense-2$ = {ക്കുക}:{ത്തു} ^-> ([#Consonants#]+ [ു]  __ [#POS##BM##Numbers##TMP#]+ <past>)
$past-tense-3$ = {യുക}:{ഞ്ഞു} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
$past-tense-4$ = {വുക}:{വി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
$past-tense-5$ = {ടുക}:{ടി} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)
$past-tense-6$ = {ലുക}:{ന്നു} ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)

$remove-vinfl$ = {<past>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$past-tense$ = $past-tense-1$ || $past-tense-2$ || $past-tense-3$ \
	|| $past-tense-4$ || $past-tense-5$ || $past-tense-6$ \
	|| $remove-vinfl$

$tenses$ = $past-tense$
$tests$ = അറിയിക്കുക<v><RB><past>

%$tests$ || \
$tenses$ || .*
