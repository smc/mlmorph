%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Optionally convert ുക + ഇല്ല to ില്ല as in പറയുകയില്ല -> പറയില്ല, പറയുകില്ല, പറയത്തില്ല
$forms$ = {ുക} : {ുക} |  {ുക} : {<del>}  | {ുക} : {[#Virama#]} | {ുക} : {ുക്} | {ുക} : {ത്ത്}
$verb-negation$ = $forms$ ^-> ( __ [#POS##BM##Numbers##TMP##compounds##Lsym#]+ ഇ ല്ല <neg> )

% ഓടുകേല, പറയുകേല
$verb-negation-variant-1$ = {ഇല്ല}:{േല} ^-> ( [#POS##BM##Numbers##TMP##compounds##Lsym#]+ __ <neg> )

% ഓടൂല, പോകൂല, ചാടൂല
$verb-negation-variant-2-1$ = {ുക} : {<del>} ^-> ( __ [#POS##BM##Numbers##TMP##compounds##Lsym#]+ ഇ ല്ല <neg> )
$verb-negation-variant-2-2$ = {ഇല്ല}:{ൂല} ^-> ( [#POS##BM##Numbers##TMP##compounds##Lsym#]+ __ <neg> )
$verb-negation-variant-2$ = $verb-negation-variant-2-1$ || $verb-negation-variant-2-2$

$verb-negation$ | $verb-negation-variant-1$ | $verb-negation-variant-2$
