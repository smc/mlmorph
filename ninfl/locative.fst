#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Locative inflection rules

$virama-forms$ = {<locative>}:{ഇൽ} | {<locative>}:{ഇങ്കൽ}
$ta-forms$ =  {<locative>}:{<dup>ടിൽ} | {<locative>}:{<dup>ടിങ്കൽ} | {<locative>}:{<dup>ടിങ്ങൽ}
$anuswara-forms$ = {<locative>}:{<del>ത്തിൽ} | {<locative>}:{<del>ത്തിങ്കൽ}

$locative-cons$ = {<locative>}:{ഇൽ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$locative-virama$ = $virama-forms$ ^-> ([#Virama##Chillus#] [#POS##BM##Numbers##TMP#]+ __)
$locative-ta$ = $ta-forms$ ^-> ([#VowelSigns#] ട [#Virama#] [#POS##BM##Numbers##TMP#]+ __)
$locative-anuswara$ = $anuswara-forms$ ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$locative-step1$ = $locative-cons$ || $locative-ta$ ||\
  $locative-virama$ || \
  $locative-anuswara$

% Post process steps
$locative-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##Numbers##TMP#]+ <del> )

$locative$ = $locative-step1$ || $locative-anuswara-step2$

$locative$
%TODO വിഭക്ത്യാഭാസം: കാട്ടിലെ, കേരളത്തിൽ, മുറ്റത്ത്, പാടത്ത്, മഴയത്ത്
% See https://ml.wikipedia.org/wiki/വിഭക്ത്യാഭാസം
