%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#] [#POS##BM##Numbers#]

% Convert atmoic chillus to cons+ virama form if followed by Vowel

$replace-chillu-k$ = {ൿ}: {ക്} ^-> ( __ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )
$replace-chillu-l$ = {ൽ}: {ല്} ^-> ( __ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )
$replace-chillu-L$ = {ൾ}: {ള്} ^-> ( __ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )
$replace-chillu-r$ = {ർ}: {ര്} ^-> ( __ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )
$replace-chillu-n$ = {ൻ}: {ന്} ^-> ( __ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )
$replace-chillu-N$ = {ൺ}: {ണ്} ^-> ( __ [#POS##BM##Numbers##TMP#]+ [#Vowels#] )

$tests$ = അവൻ <Noun> അല്ല <Noun>

$ChilluNorm$ = $replace-chillu-k$ \
	|| $replace-chillu-l$ \
	|| $replace-chillu-L$ \
	|| $replace-chillu-r$ \
	|| $replace-chillu-n$ \
	|| $replace-chillu-N$

% Uncomment below line for testing
%$tests$ ||\
$ChilluNorm$  || .*
