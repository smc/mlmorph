% --------------------------------------------------------------------------------
% ==== Imperative Mood Forms ====
% Ref: A Grammar of Malayalam - Ravisankar S Nair
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]
$verb-suffix-map$ = {ുക}:{ൂ} |\ % Less formal. വരൂ, പോകൂ, പാടൂ
	{ിക}:{ൂ} | {ുക}:{ണം} |\ % More formal. വരണം, പോകണം, പാടണം
	{ുക}: {േണ്ടതാണ്} % Extremely formal. വരേണ്ടതാണ്, പോകേണ്ടതാണ്, പാടേണ്ടതാണ്.

$imperative-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <imperative-mood>)

$imperative-mood$
