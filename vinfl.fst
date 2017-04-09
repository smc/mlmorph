#include "symbols.fst"


ALPHABET = [#AAsym#]

$past-tense-map$ = {ക്കുക}:{ക്കി} | {ങ്ങുക}:{ങ്ങി} | {ചുക}:{ചി} | {ഞ്ഞുക}:{ഞ്ഞി} | {ടുക}:{ടി} | {ണ്ണുക}:{ണ്ണി} | \
	{തുക}:{തി} | {ന്നുക}:{ന്നി} | {പുക}:{പി} | {മുക}:{മി} | {യുക}:{ഞ്ഞു} | {വുക}:{വി} | \
	{ലുക}:{ന്നു} | {റുക}:{റി} | {രുക}:{ർന്നു} | {ളുക}:{ളി} | {ശുക}:{ശി} | {ഴുക}:{ണു}
$past-tense-exceptions$ = {ഉണ്ണുക}:{ഉണ്ടു} | \
	{പോവുക}:{പോയി} | \
	{പോകുക}:{പോയി} | \
	{ആവുക}:{ആയി} | \
	{ആകുക}:{ആയി} | \
	{ചാവുക}:{ചത്തു} | \
	{ഇരിക്കുക}:{ഇരുന്നു} |\
	{കാക്കുക}:{കാത്തു} |\
	{തോൽക്കുക}:{തോറ്റു} |\
	{ൾക്കുക}:{ട്ടു}

$past-tense-ex$ = $past-tense-exceptions$ ^-> ( __ [#POS##BM##Numbers##TMP#]+ <past>)
% പറിക്കുക - പറിച്ചു, അടയ്ക്കുക - അടച്ചു
$past-tense-1$ = {ക്കുക}:{ച്ചു} ^-> ([#Consonants#]+ [ി്] __ [#POS##BM##Numbers##TMP#]+ <past>)
% അടുക്കുക - അടുത്തു, കൊടുക്കുക- കൊടുത്തു
$past-tense-2$ = {ക്കുക}:{ത്തു} ^-> ([#Consonants#]+ [ു] __ [#POS##BM##Numbers##TMP#]+ <past>)
% കരയുക - കരഞ്ഞു
% തടവുക - തടവി
% പാടുക - പാടി , ചാടുക - ചാടി
% അകലുക - അകന്നു
% അലറുക - അലറി കുതറുക - കുതറി
% എഴുതുക - എഴുതി
% പിച്ചുക - പിച്ചി
$past-tense-3$ = $past-tense-map$ ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <past>)

$remove-past-vinfl$ = {<past>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$past-tense$ = $past-tense-ex$ || $past-tense-1$ || $past-tense-2$ || $past-tense-3$  \
	|| $remove-past-vinfl$

% അടിക്കുക - അടിക്കും അടുക്കുക - അടുക്കും, കാക്കുക - കാക്കും കരയുക - കരയും തകർക്കുക - തകർക്കും
% തകരുക - തകരും
$future-tense-1$ = {ുക}:{ും} ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <future>)
$remove-future-vinfl$ = {<future>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$future-tense$ = $future-tense-1$ || $remove-future-vinfl$
% അടിക്കുക - അടിക്കുന്നു. കരയുക - കരയുന്നു.
$present-tense-1$ = {ുക}:{ുന്നു} ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <present>)
$remove-present-vinfl$ = {<present>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)

$present-tense$ = $present-tense-1$ || $remove-present-vinfl$
$tenses$ = $past-tense$ || $present-tense$ || $future-tense$

$tests$ = അറിയിക്കുക<v><RB><past>

%$tests$ || \
$tenses$ || .*
