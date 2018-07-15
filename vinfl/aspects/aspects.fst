#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

$remove-vinfl$ = {[#vinfl#]}:{} ^-> (<infl_marker> [#POS##BM##TMP#]+ __)

$perfect-aspects$ = "<perfect.a>"
$habitual-aspects$ = "<habitual.a>"
$iterative-aspects$  ="<iterative.a>"

$aspects$ = ( $perfect-aspects$ | $iterative-aspects$ | $habitual-aspects$ ) || $remove-vinfl$

$tests$ = അറിയിക്കുക<v><RB> <simple-perfect-aspect> | അറിയിക്കുക<v><RB> <remote-perfect-aspect> | അറിയിക്കുക<v><RB> <habitual-aspect>|\
	അറിയിക്കുക<v><causative-voice><RB><remote-perfect-aspect>
$tests$ || $aspects$ >> "aspects.test.a"

$aspects$