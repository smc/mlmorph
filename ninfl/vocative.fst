#include "../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Numbers#] <vocative>
% Vocative inflection rules- sambodhana - മരമേ, കാടേ, പൂച്ചേ, അവരേ, അവളേ, മലരേ, പട്ടികളേ, പട്ടീയേ
$vocative-cons$ = {<vocative>}:{ഏ} ^-> ( [#Consonants##Virama#] [#POS##BM##TMP##Numbers#]+ __)
$vocative-vowel-u$ = {<vocative>}:{വേ} ^-> ( [ൂു] [#POS##BM##TMP##Numbers#]+ __)
$vocative-vowel-i$ = {<vocative>}:{യേ} ^-> ( [ി] [#POS##BM##TMP##Numbers#]+ __)
$vocative-anuswara$ = {<vocative>}:{ഏ} ^-> ( [#Anuswara#] [#POS##BM##TMP##Numbers#]+ __)
$vocative$ = $vocative-cons$ || $vocative-vowel-u$ || $vocative-vowel-i$ || $vocative-anuswara$

%$tests$ = മഴ<n><RB><vocative> | മുറ്റം<n><RB><vocative> |  കിളി<n><RB><vocative>
%$tests$ || $vocative$ >> "vocative-test.a"

$vocative$
