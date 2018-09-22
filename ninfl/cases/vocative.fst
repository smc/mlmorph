#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Numbers#] <vocative> <del>
% Vocative inflection rules- sambodhana - മരമേ, കാടേ, പൂച്ചേ, അവരേ, അവളേ, മലരേ, പട്ടികളേ, പട്ടീയേ
$vocative-cons$ = {<vocative>}:{ഏ} ^-> ( [#Consonants##Virama##Chillus#] [#POS##BM##TMP##Numbers#]+ __ )
$vocative-vowel-u$ = {<vocative>}:{വേ} ^-> ( [ൂു] [#POS##BM##TMP##Numbers#]+ __  )
$vocative-vowel-i$ = {<vocative>}:{യേ} ^-> ( [ി] [#POS##BM##TMP##Numbers#]+ __   )
$vocative-anuswara$ = {<vocative>}:{ഏ} ^-> ([#Anuswara#] [#POS##BM##TMP##Numbers#]+ __ )
$vocative-chillu-n$ = {<vocative>}:{<del>ാ} ^-> ([#Consonants#] [ൻ] [#POS##BM##TMP##Numbers#]+ __ )
$vocative-del-chillu-n$ = {[ൻ]}:{} ^-> (__ [#POS##BM##TMP##Numbers#]+ <del> )

$vocative-chillu-n$ = $vocative-chillu-n$ || $vocative-del-chillu-n$

$vocative$ = ($vocative-cons$ | $vocative-chillu-n$) || $vocative-vowel-u$ || $vocative-vowel-i$ || $vocative-anuswara$

$tests$ = മഴ<n><RB><vocative> | മുറ്റം<n><RB><vocative> | കിളി<n><RB><vocative> | ശിവൻ<n><RB><vocative>
$tests$ || $vocative$ >> "vocative-test.a"

$vocative$
