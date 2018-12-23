%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"

%%% The stems from the lexicon (possibly with derivation)
$INTERJECTION$ = "<lexicon/interjections.a>"
$POSTPOSITIONS$ = "<lexicon/postpositions.a>"
$INDECLINABLE$ = "<lexicon/indeclinables.a>"
$QUANTIFIERS$ = "<lexicon/quantifiers.a>"
$ADJ$ = "<lexicon/adjectives.a>"
$ADV$ = "<lexicon/adverbs.a>"
$QUESTION$ = "<lexicon/questions.a>"
$POLARITY$ = "<lexicon/polarity.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"

% these following contains exceptional cases fully analyzed in the
% lexicon.
$MISC$ = "<lexicon/misc.a>"
$NINFL$ = "<ninfl/ninfl.a>"

% Numbers using digits
$NUMBER$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)? [#Perc#]? <num><RB>

% Nouns
$NOUNS$ = "<noun.a>"

% Verbs
$VERB$ = "<verb.a>"

$NOUN_VERB_COMPOUNDS$ = $NOUNS$ <n-v-compound> $VERB$ %വീട്ടിലെത്തി, വണ്ടികയറി
$WORD$ = $MISC$? ( $NOUNS$ \
	| $VERB$ $INDECLINABLE$? \
	| $NOUN_VERB_COMPOUNDS$ \
	| $POSTPOSITIONS$ $CONJUNCTION$? \
	| $ADJ$+ \
	| $ADV$+ \
	| $INTERJECTION$ \
	| $QUESTION$ $CONJUNCTION$? $POLARITY$? \
	| $POLARITY$ $CONJUNCTION$? \
	| $CONJUNCTION$ $CONJUNCTION$? $POSTPOSITIONS$? $POLARITY$? \
	| $QUANTIFIERS$ $QUANTIFIERS$? $CONJUNCTION$? $POLARITY$? \
	| $NUMBER$ \
)? $MISC$*

$WORD$
