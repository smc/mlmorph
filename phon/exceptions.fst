%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#]
% തീരം - തീരവും , കാലം - കാലവും.
$anuswaram-um$ = {ം}:{വ്} ^-> ( __ [#POS##BM##Numbers##TMP##Lsym#]+ [ഉ] [#Anuswara#])

$exceptions$ = $anuswaram-um$

$exceptions$ || .*
