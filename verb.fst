#include "symbols.fst"

% Verbs
$ADVERB$ = "<lexicon/adverbs.a>"
$VSTEM$ = "<lexicon/verbs.a>"
$VINFL$ = "<vinfl/vinfl.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"
$POLARITY$ = "<lexicon/polarity.a>"

$VERB$ = $ADVERB$? $VSTEM$ $CONJUNCTION$? [#vinfl#]? $POLARITY$? || $VINFL$

$VERB$