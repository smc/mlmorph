#include "../symbols.fst"

ALPHABET = [#AAsym#]
% Locative inflection rules
$locative-cons$ = {<locative>}:{ഇൽ} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$locative-anuswara$ = {<locative>}:{<del>ത്തിൽ} ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$locative-step1$ = $locative-cons$ | $locative-anuswara$

% Post process steps
$locative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##Numbers##TMP#]+ <del> )
$locative$ = $locative-step1$ || $locative-anuswara-step2$
$locative$
