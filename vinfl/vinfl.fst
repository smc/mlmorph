
#include "../symbols.fst"


ALPHABET = [#AAsym#]

$tenses$  = "<past.a>" || "<present.a>" || "<future.a>"
$converbs$ = "<converb.a>"

$removable-vinfl-forms$ =  {[#vinfl#]}:{}
$remove-vinfl$ = $removable-vinfl-forms$ ^-> ([#POS##BM##Numbers##TMP#]+ __)

%$tests$ = അറിയിക്കുക<v><RB><past>
%$tests$ || \
$vinfl$ = $tenses$ || $converbs$ || $remove-vinfl$

$vinfl$
