#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Delete Vowels and replace it by its vowel sign when the second word start with Vowel
% Note that we cannot do a || with all these rules without variables.
$vowel-to-vowelsign-0$ = {അ}:{<del>} ^-> ( [#POS##BM##Numbers##TMP#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-1$ = {ആ}:{ാ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-2$ = {ഇ}:{ി} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-3$ = {ഈ}:{ീ} ^->  ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-4$ = {ഉ}:{ു} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-5$ = {ഊ}:{ൂ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-6$ = {ഋ}:{ൃ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-7$ = {എ}:{െ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#]? )
$vowel-to-vowelsign-8$ = {ഏ}:{േ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-9$ = {ഐ}:{ൈ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-10$ = {ഒ}:{ൊ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-11$ = {ഓ}:{ോ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$vowel-to-vowelsign-12$ = {ഔ}:{ൗ} ^-> ( [#POS##BM##Numbers##TMP##infl#]  [#BM##TMP#] __ [#Consonants#] )
$tests$ =<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>ആയിരം<n><>:<RB><>:<EoW> \
	<>:<BoW>പൂവ്<n><>:<RB><>:<EoW><>:<BoW>അമ്പലം<n><>:<RB><>:<EoW>

$vowel-to-vowelsign$ =  $vowel-to-vowelsign-0$ || $vowel-to-vowelsign-1$ || $vowel-to-vowelsign-2$ \
 	$vowel-to-vowelsign-3$ || $vowel-to-vowelsign-4$ || $vowel-to-vowelsign-5$ \
	$vowel-to-vowelsign-6$ || $vowel-to-vowelsign-7$ || $vowel-to-vowelsign-8$ \
	$vowel-to-vowelsign-9$ || $vowel-to-vowelsign-10$ || $vowel-to-vowelsign-11$ \
	$vowel-to-vowelsign-12$
% Uncomment below line for testing
% $tests$ ||\
$vowel-to-vowelsign$
