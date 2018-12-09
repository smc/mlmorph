#include "../symbols.fst"

% Note: If we can introduce an imaginary symbol for implicit 'a' in consonants
% this can be merged with vowelsign-vowel.fst
ALPHABET = [#AAsym#]

#=C# = #Consonants#
$C$ = {[#=C#]}:{[#=C#][യ]}
$insert-ya$ = $C$ ^-> (__ [#MALAYALAMPOS##BM##Numbers##infl##TMP##Lsym##compounds#]+ [#Vowels#] )

% നത<sanskrit><RB><adj>അംഗി<sanskrit><RB><adj>:നതാംഗി
$elongate-a-sanskrit$ = {അ}:{ആ} ^-> ([#Consonants#] <sanskrit> [#POS##BM##Numbers##infl##TMP##Lsym##compounds#]+ __ )

$cons-vowel$ = $insert-ya$ || $elongate-a-sanskrit$

$tests$ = തറ <hundreds> അടി <Noun>
% Uncomment below line for testing
% $tests$ ||\


%$test$ = <>:<BoW>ഓല<n><RB><locative>ഏ<indeclinable><RB><>:<EoW>
%$test$ || $cons-vowel$  >> "cv.test.a"

$cons-vowel$ || .*
