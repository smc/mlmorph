
#include "symbols.fst"

$NSTEM$ = "<lexicon/nouns.a>"
$PRONOUN$ = "<lexicon/pronouns.a>"
$PROPERNOUN$ = "<lexicon/proper-nouns.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"
$POSTPOSITIONS$ = "<lexicon/postpositions.a>"
$INDECLINABLE$ = "<lexicon/indeclinables.a>"
$ABBREV$ = "<lexicon/abbreviations.a>"
$DEM$ = "<lexicon/demonstratives.a>"
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

$ADJPART$ = ( ( $NSTEM$ | $PROPERNOUN$ ) <adj>) || "<ninfl/adjective.a>"
$COMPOUND_NSTEM$ = ( $ADJPART$* ( $NSTEM$ | $PROPERNOUN$ ) ) |\ % വിശേഷണവിശേഷ്യങ്ങൾ
	( $NSTEM$ <coordinative> $NSTEM$ ) % ദ്വന്ദസമാസം - ആനകുതിര, അച്ഛനമ്മ..
$SINGULAR_NOUN$ = $COMPOUND_NSTEM$ | $PRONOUN$ | $ABBREV$ | $BORROWED$ | $DERIVEDNOUNS$
$PLURAL_NOUN$ = $SINGULAR_NOUN$ <pl> || $PLURAL$

$SUFFIXES$ = $POSTPOSITIONS$ | $CONJUNCTION$ | $POLARITY$
$SUFFIXES$ = $SUFFIXES$? $SUFFIXES$ % Atmost 2 times

$NOUN$ = $DEM$ |\
	$ADJPART$+ |\ % Words ending with adjevtives alone. തീരദേശ, മലയാള, സമുദ്ര etc
	( $DEM$? $ADJECTIVE$? ( $SINGULAR_NOUN$ | ( $PLURAL_NOUN$ <EoW><RB> ) ) [#ninfl#]? $SUFFIXES$? )

$NOUN$ = $NOUN$ || $NINFL$
$NOUN$ $INDECLINABLE$?
