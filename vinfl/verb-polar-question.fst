%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Polar questions in Malayalam are formed by adding the
% interrogative clitic ഓ to the predicate of an affirmative clause
% ഓടുമോ, പാടുമോ, പറയുമോ
$verb-polar-question-present$ = {ക}:{മോ\?} ^-> ( ു __ [#POS##BM##TMP##vinfl#]+  <qn> )
% ഓടുമോ, പാടുമോ, പറയുമോ
$verb-polar-question-future$ = {ം}:{മോ\?} ^-> ( ു __ [#POS##BM##TMP##vinfl#]+  <qn> )
% ഓടിയോ, പറഞ്ഞോ
$verb-polar-question-past$ = {ു}:{ോ\?} | {ു}:{ുവോ\?} | {ി} : {ിയോ\?} ^-> ( __ [#POS##BM##TMP##vinfl#]+ <qn> )

$verb-polar-question$ = $verb-polar-question-present$ || \
    $verb-polar-question-past$ || \
    $verb-polar-question-future$

ചിരിക്കുക<v><RB><qn> | ചിരിച്ചു<v><past><RB><qn>  ||  $verb-polar-question$ >> "vstem-qns.a"

$verb-polar-question$