
#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
$converbs$ = "<converb.a>"
$clauses$ = "<clauses.a>"
$remove-vinfl$ = {[#vinfl#]}:{} ^-> (<infl_marker> [#POS##BM##TMP#]+ __)

$adverbs$ = ($clauses$ || $converbs$ ) || $remove-vinfl$

%$tests$ = പതറുക<v><RB> [#vinfl#]
% $tests$ || $adverbs$ >> "adverbs.test.a"

$adverbs$
