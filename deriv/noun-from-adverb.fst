%% Verbal Nouns %%%%

#include "../symbols.fst"

ALPHABET = [#AAsym#]

% ഉദാഹരണം: ഓടുന്നത് ചാടുന്നത്, പറയുന്നത് പറഞ്ഞത് ചിരിക്കാത്തത്

$nouns$ = ( [#Letters##POS##BM##Numbers##TMP##vinfl#]+ [#Consonants#] <infl_marker>:{ത്} [#POS##BM##TMP##infl#]+ <n> <deriv> )

$tests$ = ചിരിക്കുക<v><iterative-past-aspect><adv-clause-rp-past>  <n> <deriv>
($tests$ || $nouns$ ) >> "n-f-ad.a"

$nouns$
