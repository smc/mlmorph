%% Verbal Nouns %%%%

#include "../symbols.fst"

% ഉദാഹരണം: ഓടുന്നത് ചാടുന്നത്, പറയുന്നത് പറഞ്ഞത് ചിരിക്കാത്തത്
$map$ = <infl_marker>:{ത്} | <infl_marker>:{തു്}
$nouns$ = ( [#Letters##POS##BM##Numbers##TMP##vinfl#]+ [#Consonants#] $map$ [#POS##BM##TMP##infl#]+ <n> <deriv> )

$tests$ = ചിരിക്കുക<v><iterative-past-aspect><adv-clause-rp-past>  <n> <deriv>
($tests$ || $nouns$ ) >> "n-f-ad.a"

$nouns$
