
#include "../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
$tenses$ = "<past.a>" || "<present.a>" || "<future.a>"
$concessives$ = "<concessive.a>"

$remove-vinfl$ = {[#vinfl#]}:{} ^-> (<infl_marker> [#POS##BM##TMP#]+ __)

$tense$ = ($tenses$ || $concessives$) || $remove-vinfl$

%$tests$ = പതറുക<v><RB> [#vinfl#]
% $tests$ || $tense$  >> "tense.test.a"

$tense$
