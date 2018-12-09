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
$VERB-PREFIX$ = $ADVERB$? $VSTEM$ [#vinfl#]? $CONJUNCTION$* $POLARITY$?
$VERB-TENSES$ = $VERB-PREFIX$ || $TENSES$
$VERB-MOODS$ = $VERB-PREFIX$ || $MOODS$
$VERB-ASPECTS$ = $VERB-PREFIX$ || $ASPECTS$
$VERB-ADVERBS$ = $VSTEM$ [#adv#] || $ADVERBSTEMS$

% For the output of aspects, apply adv-clause-rp-past, but limit it only for the outputs ending with ു
% Example: പാടിയിരുന്നു->പാടിയിരുന്ന, വന്നുകൊണ്ടിരുന്നു->വന്നുകൊണ്ടിരുന്ന
$ENDS_WITH_U_FILTER$ = [#Letters##POS##BM##Numbers##TMP##vinfl#]+ ു [#POS##BM##Numbers##TMP##vinfl#]+
$VERB-ADVERBS-FROM-INFLECTIONS$ = ( $VERB-ASPECTS$ || $ENDS_WITH_U_FILTER$ ) <RB> <adv-clause-rp-past> || $ADVERBSTEMS$
$VERB-ADVERBS$ = $VERB-ADVERBS$ | $VERB-ADVERBS-FROM-INFLECTIONS$

$VERB$ = $VERB-TENSES$ | $VERB-MOODS$ | $VERB-ASPECTS$ | $VERB-ADVERBS$
$VERB-ADVERBS$ >> "verb-adverbs.a"

% Tests
$tests$ = (ചിരിക്കുക<v><RB> | വായിക്കുക<v><RB> ) [#vinfl#]
( $tests$ || $ASPECTS$ || $ENDS_WITH_U_FILTER$ ) <RB> [<adv-clause-rp-past>] || $ADVERBSTEMS$ >> "verb.test.a"
$VSTEM-PASSIVE$ >> "vstem-passive.test.a"
$VSTEM-CAUSATIVE$ >> "vstem-causative.test.a"
$VERB-ADVERBS-FROM-INFLECTIONS$ >> "verb-adverbs.test.a"
ചിരിക്കുക<v><RB>  [#vinfl#]? || $ASPECTS$ >> "vstem-aspects.a"

$VERB$+
