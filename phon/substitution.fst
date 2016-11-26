%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#] [#POS##BM##Numbers#]

% Delete Vowels and replace it by its vowel sign when the vowel

$replace-vowel-by-sign-a$ = {അ}: {<>} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-aa$ = {ആ}: {ാ} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-i$ = {ഇ}: {ി} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-u$ = {ഉ}: {ു}  ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-U$ = {ഊ}: {ൂ}  ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-I$ = {ഈ}: {ീ} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-e$ = {എ}: {െ} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-E$ = {ഏ}: {േ} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-ai$ = {ഐ}: {ൈ} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-o$ = {ഒ}: {ൊ} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-au$ = {ഔ}: {ൗ} ^-> ( [#POS##BM##Numbers#] __ )
$replace-vowel-by-sign-ou$ = {ഔ}: {ൌ}  ^-> ( [#POS##BM##Numbers#] __ )

$tests$ = പൂവ <Noun> അമ്പലം <Noun>

$Sub$ = $replace-vowel-by-sign-a$ ||\
	$replace-vowel-by-sign-aa$ ||\
	$replace-vowel-by-sign-i$ || \
	$replace-vowel-by-sign-I$ || \
	$replace-vowel-by-sign-u$ || \
	$replace-vowel-by-sign-U$ || \
	$replace-vowel-by-sign-e$ ||\
	$replace-vowel-by-sign-E$ ||\
	$replace-vowel-by-sign-ai$ ||\
	$replace-vowel-by-sign-o$ || \
	$replace-vowel-by-sign-au$ || \
	$replace-vowel-by-sign-ou$


% Uncomment below line for testing
% $tests$ ||\
$Sub$  || .*
