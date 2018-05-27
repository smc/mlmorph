#include "symbols.fst"

% Verbs
$ADVERB$ = "<lexicon/adverbs.a>"
$VSTEM$ = "<lexicon/verbs.a>"
$TENSES$ = "<vinfl/tense.a>"
$MOODS$ = "<vinfl/moods/moods.a>"
$ASPECTS$ = "<vinfl/aspects/aspects.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"
$POLARITY$ = "<lexicon/polarity.a>"

$VERB-PREFIX$ = $ADVERB$? $VSTEM$ $CONJUNCTION$? [#vinfl#]? $POLARITY$?
$VERB-TENSES$ = $VERB-PREFIX$ || $TENSES$
$VERB-MOODS$ = $VERB-PREFIX$ || $MOODS$
$VERB-ASPECTS$ = $VERB-PREFIX$ || $ASPECTS$

$VERB$ = $VERB-TENSES$ | $VERB-MOODS$ | $VERB-ASPECTS$

$VERB$