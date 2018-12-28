%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Optionally convert ുക + ഇല്ല to ില്ല as in പറയുകയില്ല -> പറയില്ല, പറയുകില്ല, പറയത്തില്ല
$forms$ = {ുക} : {ുക} |  {ുക} : {<del>}  | {ുക} : {[#Virama#]} | {ുക} : {ുക്} | {ുക} : {ത്ത്}
$verb-negation$ = $forms$ ^-> ( __ [#POS##BM##Numbers##TMP##compounds##Lsym#]+ ഇ ല്ല <neg> )

$verb-negation$
