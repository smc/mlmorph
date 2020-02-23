#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Ya insertion between a consonant and vowel. Only if the second word is malayalam and not sanskrit
#=C# = #Consonants#
$C$ = {[#=C#]}:{[#=C#][യ]}

$INSERT-YA-SUFFIX$ = [#POS##BM##Numbers##infl##TMP##Lsym##compounds#]+ [#Vowels#] [#Letters#]* [#MALAYALAMPOS##BM##Numbers##infl##TMP##Lsym##compounds#]
$insert-ya$ = $C$ ^-> (__ $INSERT-YA-SUFFIX$ )

% Remove the ya inserted at $insert-ya$ if it is repeated as in പുതിയയൊരു -> പുതിയൊരു
$remove-extra-ya-malayalam$ = {യ}:{} ^-> ([#Consonants##VowelSigns#] യ __ [<adv><adj>#BM##Numbers##infl##TMP##Lsym##compounds#]+ [#Vowels#] )

% Special case of ഇല്ല + എങ്കിൽ -> ഇല്ലയെങ്കിൽ -> ഇല്ലെങ്കിൽ
$remove-extra-ya-malayalam-special$ = {യ}:{} ^-> ([ഇി] ല്ല __  [<neg>#BM##Numbers##infl##TMP##Lsym##compounds#]+ [എ] )

% നത<sanskrit><RB><adj>അംഗി<sanskrit><RB><adj>:നതാംഗി
$elongate-a-sanskrit$ = {അ}:{ആ} ^-> ([#Consonants#] <sanskrit> [#POS##BM##Numbers##infl##TMP##Lsym##compounds#]+ __ [#Letters#]+ <sanskrit> )

$cons-vowel$ = $insert-ya$ || $remove-extra-ya-malayalam$ || $remove-extra-ya-malayalam-special$ || $elongate-a-sanskrit$

$tests$ = തറ <hundreds> അടി <Noun>
% Uncomment below line for testing
% $tests$ ||\

$test$ = <>:<BoW>ഓല<n><RB><locative>ഏ<indeclinable><RB><>:<EoW> |\
  <>:<BoW>ഭാഷ<sanskrit><RB>ഇൽ<locative>ഏ<indeclinable><RB><>:<EoW> |\
  <>:<BoW>ഭാഷ<sanskrit><RB>അല്ല<neg><RB><>:<EoW> |\
  <>:<BoW>പുതിയ<adj><RB>ഒരു<adj><RB><>:<EoW> |\
  <>:<BoW>ആസ്ത്രേലിയ<np><RB>ഇൽ<locative><>:<EoW>

$test$ || $cons-vowel$ || .* >> "cv.test.a"

$cons-vowel$
