$imperative-mood$ = "<imperative.a>"
$compulsive-mood$ = "<compulsive.a>"
$promissive-mood$ = "<promissive.a>"
$optative-mood$ = "<optative.a>"

$moods$ = $imperative-mood$ || $compulsive-mood$ || $promissive-mood$ || $optative-mood$

$tests$ = അറിയിക്കുക<v><RB> <imperative-mood> | അറിയിക്കുക<v><RB> <compulsive-mood> | അറിയിക്കുക<v><RB> <compulsive-mood-neg> | പതറുക<v><RB><compulsive-mood>
$tests$ || $moods$ >> "moods.test.a"

$moods$