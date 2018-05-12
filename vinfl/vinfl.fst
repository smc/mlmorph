
#include "../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
$tenses$ = "<past.a>" || "<present.a>" || "<future.a>"
$converbs$ = "<converb.a>"
$concessives$ = "<concessive.a>"
$aspects$ = "<aspects/aspects.a>"
$moods$ = "<moods/moods.a>"

$remove-vinfl$ = {[#vinfl#]}:{} ^-> (<infl_marker> [#POS##BM##TMP#]+ __)

$vinfl-1$ = ($tenses$ | $converbs$ | $concessives$) || $remove-vinfl$
$vinfl-1$ >> "vinfl.1.a"

$vinfl-2$ = $aspects$ || $remove-vinfl$
$vinfl-2$ >> "vinfl.2.a"

$vinfl-3$ = $moods$ || $remove-vinfl$
$vinfl-3$ >> "vinfl.3.a"

$vinfl$ = "<vinfl.1.a>" | "<vinfl.2.a>" | "<vinfl.3.a>"

$tests$ = പതറുക<v><RB> [#vinfl#]
$tests$ || $vinfl$ >> "vinfl.test.a"

$vinfl$
