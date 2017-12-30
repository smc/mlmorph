%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"

%%% The stems from the lexicon (possibly with derivation)
$NSTEM$ = "<lexicon/nouns.a>"
$PRONOUN$ = "<lexicon/pronouns.a>"
$PROPERNOUN$ = "<lexicon/proper-nouns.a>"
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
$PLURAL$ = "<ninfl/plural.a>"

% Verbs
$VSTEM$ = "<lexicon/verbs.a>"
$VINFL$ = "<vinfl/vinfl.a>"
% Numbers using digits
$NUMBER$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)? [#Perc#]? <num><RB>

% Nouns
$NOUNFROMVERB$ = "<deriv/noun-from-verb.a>"
$NOUNFROMNOUN$ = "<deriv/noun-from-noun.a>"
$DERIVEDNOUNS$ = (($VSTEM$ <n> <deriv> ) || $NOUNFROMVERB$) |\
	( ($NSTEM$ [<masculine><feminine><neutral>] <n> <deriv>) || $NOUNFROMNOUN$)

$SINGULAR_NOUN$ = $NSTEM$ | $PRONOUN$ | $CONJUNCTION$ | $ABBREV$ | $PROPERNOUN$ | $BORROWED$ | $DERIVEDNOUNS$
$PLURAL_NOUN$ = $SINGULAR_NOUN$ <pl> || $PLURAL$

$NOUN$ = $ADJECTIVE$? ( $SINGULAR_NOUN$ | ( $PLURAL_NOUN$ <EoW><RB> ) ) [#ninfl#]? $POLARITY$? || $NINFL$

% Verbs
$VERB$ = $ADVERB$? $VSTEM$ $CONJUNCTION$? [#vinfl#]? $POLARITY$? || $VINFL$

% Quantifiers, cardinals, ordinals
$ordinal$= ({}:{ആം}|{}:{ആമത്തെ}|{}:{ആമത്}|{}:{ആമതു്}) <ordinal>
$QUANTIFIER$ = $QUANTIFIERS$ | ( $NUMBERS$ $ordinal$? [#ninfl#]? || $NINFL$ )

$WORD$ = $MISC$? ( $NOUN$+ $INDECLINABLE$? \
	| $VERB$+ $INDECLINABLE$? \
	| $PREPOSITIONS$ \
	| $INTERJECTION$ \
	| $QUESTION$ \
	| $POLARITY$ \
	| $NUMBER$ \
	| $QUANTIFIER$ \
) $MISC$?

$WORD$
