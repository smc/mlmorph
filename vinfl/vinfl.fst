
#include "../symbols.fst"


ALPHABET = [#AAsym#]

$tenses$  = "<past.a>" || "<present.a>" || "<future.a>"
$converbs$ = "<converb.a>"
$concessives$ = "<concessive.a>"

$removable-vinfl-forms$ =  {[#vinfl#]}:{}
$remove-vinfl$ = $removable-vinfl-forms$ ^-> ([#POS##BM##Numbers##TMP#]+ __)

$vinfl$ = $tenses$ || $converbs$ || $concessives$ || $remove-vinfl$


$tests$ = അറിയിക്കുക<v><RB> [#vinfl#]
$tests$ || $vinfl$ >> "vinfl.test.a"

$vinfl$
