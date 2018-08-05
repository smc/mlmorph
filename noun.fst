
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

$ENDS_WITH_ANUSWARA_FILTER$ = [#Letters#]+ ം [<n><np><RB>]+
$ADJ_CANDIDATES$ = ( $NSTEM$ | $PROPERNOUN$ ) || $ENDS_WITH_ANUSWARA_FILTER$
$ADJ_PART$ = ( $ADJ_CANDIDATES$ <adj>) || "<ninfl/adjective.a>"

$COMPOUND_NSTEM$ = ( ( ( $NSTEM$ | $PROPERNOUN$ ) <adj>)* ( $NSTEM$ | $PROPERNOUN$ ) ) |\ % വിശേഷണവിശേഷ്യങ്ങൾ
	( $NSTEM$ <coordinative> $NSTEM$ ) % ദ്വന്ദസമാസം - ആനകുതിര, അച്ഛനമ്മ..
$SINGULAR_NOUN$ = $COMPOUND_NSTEM$ | $PRONOUN$ | $ABBREV$ | $BORROWED$ | $DERIVEDNOUNS$
$PLURAL_NOUN$ = $SINGULAR_NOUN$ <pl> || $PLURAL$

$SUFFIXES$ = $POSTPOSITIONS$ | $CONJUNCTION$ | $POLARITY$
$SUFFIXES$ = $SUFFIXES$? $SUFFIXES$ % Atmost 2 times

$NOUN$ = $DEM$ |\
	$ADJ_PART$+ |\ % Words ending with adjevtives alone. തീരദേശ, മലയാള, സമുദ്ര etc
	( $DEM$? $ADJECTIVE$? ( $SINGULAR_NOUN$ | ( $PLURAL_NOUN$ <EoW><RB> ) ) [#ninfl#]? $SUFFIXES$? )

$NOUN$ = $NOUN$ || $NINFL$

% $test$ = വഴി<n><RB><locative>കൂടി<cnj><RB> |  വഴി<n><RB><locative>
$ $test$ || $NOUN$ >> "noun.test.a"

$NOUN$ $INDECLINABLE$?
