#include "symbols.fst"

% Verbs
$ADVERB$ = "<lexicon/adverbs.a>"
$VSTEM$ = "<lexicon/verbs.a>"
$TENSES$ = "<vinfl/tense.a>"
$MOODS$ = "<vinfl/moods/moods.a>"
$ASPECTS$ = "<vinfl/aspects/aspects.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"
$POLARITY$ = "<lexicon/polarity.a>"
$PASSIVEVOICE$ = "<vinfl/voices/passive.a>"
$CAUSATIVEVOICE$ = "<vinfl/voices/causative.a>"
$ADVERBSTEMS$ = "<vinfl/adverbs/adverbs.a>"

$VSTEM-PASSIVE$ = $VSTEM$ <passive-voice> || $PASSIVEVOICE$
$VSTEM-CAUSATIVE$ = $VSTEM$ <causative-voice> || $CAUSATIVEVOICE$
$VSTEM$ = $VSTEM$ | $VSTEM-PASSIVE$ <RB> | $VSTEM-CAUSATIVE$ <RB>
$VERB-PREFIX$ = $ADVERB$? $VSTEM$ $CONJUNCTION$? [#vinfl#]? $POLARITY$?
$VERB-TENSES$ = $VERB-PREFIX$ || $TENSES$
$VERB-MOODS$ = $VERB-PREFIX$ || $MOODS$
$VERB-ASPECTS$ = $VERB-PREFIX$ || $ASPECTS$
$VERB-ADVERBS$ = $VSTEM$ [#adv#] || $ADVERBSTEMS$

$VERB$ = $VERB-TENSES$ | $VERB-MOODS$ | $VERB-ASPECTS$ | $VERB-ADVERBS$

% Tests
$tests$ = (ചിരിക്കുക<v><RB> | സ്വീകരിക്കപ്പെടുക<v><RB><passive-voice> | ചിരിക്കുക<v><RB><causative-voice> ) [#vinfl#]
$tests$ || ( $TENSES$ | $MOODS$ | $ASPECTS$ )  >> "verb.test.a"
$VSTEM-PASSIVE$ >>  "vstem-passive.test.a"
$VSTEM-CAUSATIVE$ >>  "vstem-causative.test.a"

$VERB$
