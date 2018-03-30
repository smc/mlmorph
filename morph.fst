%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"

%%% The stems from the lexicon (possibly with derivation)
$ADVERB$ = "<lexicon/adverbs.a>"
$ADJECTIVE$ = "<lexicon/adjectives.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"
$INTERJECTION$ = "<lexicon/interjections.a>"
$PREPOSITIONS$ = "<lexicon/prepositions.a>"
$INDECLINABLE$ = "<lexicon/indeclinables.a>"
$QUANTIFIERS$ = "<lexicon/quantifiers.a>"
$QUESTION$ = "<lexicon/questions.a>"
$NUMBERS$ = "<num.a>"
$DEM$ = "<lexicon/demonstratives.a>"
$BORROWED$ = "<lexicon/borrowed-words.a>"
$ABBREV$ = "<lexicon/abbreviations.a>"
$POLARITY$ = "<lexicon/polarity.a>"

% these following contains exceptional cases fully analyzed in the
% lexicon.
$MISC$ = "<lexicon/misc.a>"
$NINFL$ = "<ninfl/ninfl.a>"

% Verbs
$VSTEM$ = "<lexicon/verbs.a>"
$VINFL$ = "<vinfl/vinfl.a>"
% Numbers using digits
$NUMBER$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)? [#Perc#]? <num><RB>

% Nouns
$NOUNS$ = "<noun.a>"

% Verbs
$VERB$ = $ADVERB$? $VSTEM$ $CONJUNCTION$? [#vinfl#]? $POLARITY$? || $VINFL$

% Quantifiers, cardinals, ordinals
$ordinal$= ({}:{ആം}|{}:{ആമത്തെ}|{}:{ആമത്}|{}:{ആമതു്}) <ordinal>
$QUANTIFIER$ = $QUANTIFIERS$ | ( $NUMBERS$ $ordinal$? [#ninfl#]? || $NINFL$ )

$WORD$ = $MISC$? ( $NOUNS$ \
	| $VERB$+ $INDECLINABLE$? \
	| $PREPOSITIONS$ \
	| $INTERJECTION$ \
	| $QUESTION$ \
	| $POLARITY$ \
	| $NUMBER$ \
	| $QUANTIFIER$ \
) $MISC$?

$WORD$
