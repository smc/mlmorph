#include "../symbols.fst"

% Note: If we can introduce an imaginary symbol for implicit 'a' in consonants
% this can be merged with vowelsign-vowel.fst
ALPHABET = [#AAsym#]

#=C# = #Consonants#
$C$ = {[#=C#]}:{[#=C#][യ]}
$insert-ya$ = $C$ ^-> (__ [#POS##BM##Numbers##infl##TMP##Lsym##compounds#]+ [#Vowels#] )

% നത<sanskrit><RB><adj>അംഗി<sanskrit><RB><adj>:നതാംഗി
$elongate-a-sanskrit$ = {അ}:{ആ} ^-> ([#Consonants#] <sanskrit> [#POS##BM##Numbers##infl##TMP##Lsym##compounds#]+ __  )

% Remove the ya inserted at $insert-ya$ if it is sanskrit
$remove-extra-ya-sanskrit$ = {യ}:{} ^-> ( __ <sanskrit> [#POS##BM##Numbers##infl##TMP##Lsym##compounds#]+ ആ )

$cons-vowel$ = $insert-ya$ || $elongate-a-sanskrit$ || $remove-extra-ya-sanskrit$

$tests$ = തറ <hundreds> അടി <Noun>
% Uncomment below line for testing
% $tests$ ||\


$test$ = <>:<BoW>ഓല<n><RB><locative>ഏ<indeclinable><RB><>:<EoW> |\
    <>:<BoW>ഭാഷ<sanskrit><RB>ഇൽ<locative>ഏ<indeclinable><RB><>:<EoW> |\
    <>:<BoW>ഭാഷ<sanskrit><RB>അല്ല<neg><RB><>:<EoW>
$test$ || $cons-vowel$ || .* >> "cv.test.a"

$cons-vowel$ || .*
