#include "../symbols.fst"

ALPHABET = [#AAsym#]
$virama-forms$ = {<locative>}:{ഇൽ} | {<locative>}:{ഇങ്കൽ}
$anuswara-forms$ = {<locative>}:{<del>ത്തിൽ} | {<locative>}:{<del>ത്തിങ്കൽ}
% Locative inflection rules
$locative-cons$ = {<locative>}:{ഇൽ} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$locative-virama$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#POS##BM##Numbers##TMP#]+ __)
$locative-anuswara$ = $anuswara-forms$ ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$locative-step1$ = $locative-cons$ | $locative-virama$ | $locative-anuswara$

% Post process steps
$locative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##Numbers##TMP#]+ <del> )
$locative$ = $locative-step1$ || $locative-anuswara-step2$
$locative$
%TODO: കാട്ടിൽ/കാടിൽ തോട്ടിൽ/തോടിൽ
%TODO വിഭക്ത്യാഭാസം: കാട്ടിലെ, കേരളത്തിൽ, മുറ്റത്ത്, പാടത്ത്, മഴയത്ത്
% See https://ml.wikipedia.org/wiki/വിഭക്ത്യാഭാസം
