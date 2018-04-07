
#include "symbols.fst"

$NSTEM$ = "<lexicon/nouns.a>"
$PRONOUN$ = "<lexicon/pronouns.a>"
$PROPERNOUN$ = "<lexicon/proper-nouns.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"
$INDECLINABLE$ = "<lexicon/indeclinables.a>"
$ABBREV$ = "<lexicon/abbreviations.a>"
$VSTEM$ = "<lexicon/verbs.a>"
$BORROWED$ = "<lexicon/borrowed-words.a>"
$PLURAL$ = "<ninfl/plural.a>"
$NINFL$ = "<ninfl/ninfl.a>"
$ADJECTIVE$ = "<lexicon/adjectives.a>"
$POLARITY$ = "<lexicon/polarity.a>"

% Nouns
$NOUNFROMVERB$ = "<deriv/noun-from-verb.a>"
$NOUNFROMNOUN$ = "<deriv/noun-from-noun.a>"
$DERIVEDNOUNS$ = (($VSTEM$ <n> <deriv> ) || $NOUNFROMVERB$) |\
	( ($NSTEM$ [<masculine><feminine><neutral>] <n> <deriv>) || $NOUNFROMNOUN$)

$COMPOUND_NSTEM$ = ( ($NSTEM$ <adj>)* $NSTEM$ ) |\
	( $NSTEM$ <coordinative> $NSTEM$ )
$SINGULAR_NOUN$ = $COMPOUND_NSTEM$ | $PRONOUN$ | $ABBREV$ | $PROPERNOUN$ | $BORROWED$ | $DERIVEDNOUNS$
$PLURAL_NOUN$ = $SINGULAR_NOUN$ <pl> || $PLURAL$

$NOUN$ = $ADJECTIVE$? ( $SINGULAR_NOUN$ | ( $PLURAL_NOUN$ <EoW><RB> ) ) [#ninfl#]? $CONJUNCTION$? $POLARITY$? || $NINFL$

$NOUN$ $INDECLINABLE$?
