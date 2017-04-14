#include "../symbols.fst"

ALPHABET = [#AAsym#]
% Vocative inflection rules- sambodhana - മരമേ, കാടേ, പൂച്ചേ, അവരേ, അവളേ, മലരേ, പട്ടികളേ, പട്ടീയേ
$vocative-cons$ = {<vocative>}:{ഏ} ^-> ( [#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$vocative-vowel-u$ = {<vocative>}:{വേ} ^-> ( [ൂു] [#POS##BM##Numbers##TMP#]+ __)
$vocative-vowel-i$ = {<vocative>}:{യേ} ^-> ( [ി] [#POS##BM##Numbers##TMP#]+ __)
$vocative-anuswara$ = {<vocative>}:{ഏ} ^-> ( [#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$vocative$ = $vocative-cons$ || $vocative-vowel-u$ || $vocative-vowel-i$ || $vocative-anuswara$

%$tests$ = മഴ<n><RB><vocative> | മുറ്റം<n><RB><vocative>
%$tests$ || $vocative$ >> "vocative-test.a"

$vocative$
