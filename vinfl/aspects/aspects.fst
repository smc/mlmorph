$perfect-aspects$ = "<perfect.a>"
$habitual-aspects$ = "<habitual.a>"
$iterative-aspects$  ="<iterative.a>"

$aspects$ = $perfect-aspects$ | $iterative-aspects$ | $habitual-aspects$

$tests$ = അറിയിക്കുക<v><RB> <simple-perfect-aspect> | അറിയിക്കുക<v><RB> <remote-perfect-aspect> | അറിയിക്കുക<v><RB> <habitual-aspect>
$tests$ || $aspects$ >> "aspects.test.a"

$aspects$