
#include "../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
$tenses$ = "<past.a>" || "<present.a>" || "<future.a>"
$converbs$ = "<converb.a>"
$concessives$ = "<concessive.a>"

$remove-vinfl$ = {[#vinfl#]}:{} ^-> (<infl_marker> [#POS##BM##TMP#]+ __)

$tense$ = ($tenses$ | $converbs$ | $concessives$) || $remove-vinfl$

%$tests$ = പതറുക<v><RB> [#vinfl#]
% $tests$ || $tense$  >> "tense.test.a"

$tense$