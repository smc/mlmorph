
#include "../symbols.fst"


ALPHABET = [#Letters##POS##BM##TMP##infl#]

$tenses$  = "<past.a>" || "<present.a>" || "<future.a>"
$converbs$ = "<converb.a>"
$concessives$ = "<concessive.a>"

$remove-vinfl$ = {[#vinfl#]}:{} ^-> (<infl_marker> [#POS##BM##TMP#]+ __)

$vinfl$ = ( $tenses$ | $converbs$ | $concessives$ ) || $remove-vinfl$

% $tests$ = അറിയിക്കുക<v><RB> [#vinfl#]
% $tests$ || $vinfl$ >> "vinfl.test.a"

$vinfl$
