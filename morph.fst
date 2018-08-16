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
$QUESTION$ = "<lexicon/questions.a>"
$PLURAL$ = "<ninfl/plural.a>"
$NUMBERSPELLOUT$ = "<num.a>"
$BORROWED$ = "<lexicon/borrowed-words.a>"
$ABBREV$ = "<lexicon/abbreviations.a>"
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

% Quantifiers, cardinals, ordinals
$ordinal$= ({}:{ആം}|{}:{ആമത്തെ}|{}:{ആമത്}|{}:{ആമതു്}) <ordinal>
$NUMBERSPELLOUT_PLURAL$ = $NUMBERSPELLOUT$ <pl> || $PLURAL$

$QUANTIFIER$ = $QUANTIFIERS$ | \
	$NUMBER$ | \
	( ( ( $NUMBERSPELLOUT$ $ordinal$? ) | $NUMBERSPELLOUT_PLURAL$ ) [#ninfl#]? || $NINFL$ )

$NOUN_VERB_COMPOUNDS$ = $NOUNS$ <v-n-compound> $VERB$ %വീട്ടിലെത്തി, വണ്ടികയറി
$WORD$ = $MISC$? ( $NOUNS$ \
	| $VERB$+ $INDECLINABLE$? \
	| $NOUN_VERB_COMPOUNDS$ \
	| $POSTPOSITIONS$ \
	| $INTERJECTION$ \
	| $QUESTION$ \
	| $POLARITY$ \
	| $CONJUNCTION$ \
	| $QUANTIFIER$ \
)? $MISC$*

$WORD$
