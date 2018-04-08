#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Delete Vowels and replace it by its vowel sign when the second word start with Vowel
$vowel-to-vowelsign-map$ = {അ}:{<del>} |\
	{ആ}:{ാ} | {ഇ}:{ി} | {ഈ}:{ീ} | {ഉ}:{ു} | {ഊ}: {ൂ} | {ഋ}:{ൃ} |\
	{എ}:{െ} | {ഏ}:{േ} | {ഐ}:{ൈ} | {ഒ}:{ൊ} | {ഓ}:{ോ} | {ഔ}:{ൗ}

$vowel-to-vowelsign$ = $vowel-to-vowelsign-map$ ^-> ( [#Consonants##VowelSigns#]+ [#POS##BM##Numbers##TMP##infl##Lsym#]+ __ )

$tests$ =<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>ആയിരം<n><>:<RB><>:<EoW> \
	<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>അമ്പലം<n><>:<RB><>:<EoW>

% Uncomment below line for testing
% $tests$ ||\
$vowel-to-vowelsign$
