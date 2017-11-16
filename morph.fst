%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"

%%% The stems from the lexicon (possibly with derivation)
$NSTEM$ = "<lexicon/nouns.a>"
$PRONOUN$ = "<lexicon/pronouns.a>"
$PROPERNOUN$ = "<lexicon/proper-nouns.a>"
$ASTEM$ = "<lexicon/adverbs.a>"
$ADJECTIVE$ = "<lexicon/adjectives.a>"
$CONJUNCTION$ = "<lexicon/conjunctions.a>"
$INTERJECTION$ = "<lexicon/interjections.a>"
$QUESTION$ = "<lexicon/questions.a>"
$NUMBERS$ = "<num.a>" <num><RB>
$DEM$ = "<lexicon/demonstratives.a>"
$ABBREV$ = "<lexicon/abbreviations.a>"
% these following contains exceptional cases fully analyzed in the
% lexicon.
$MISC$ = "<lexicon/misc.a>"
$NINFL$ = "<ninfl/ninfl.a>"
$PLURAL$ = "<ninfl/plural.a>"

% Verbs
$VSTEM$ = "<lexicon/verbs.a>"
$VINFL$ = "<vinfl.a>"
% Numbers using digits
$NUMBER$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)?  [#Perc#]?  <num><RB>

% Nouns
$SINGULAR_NOUN$ = $NSTEM$ | $PRONOUN$ | $CONJUNCTION$ | $NUMBERS$ | $ABBREV$ | $PROPERNOUN$
$PLURAL_NOUN$ = $SINGULAR_NOUN$ <pl> || $PLURAL$

$NOUN$ = $ADJECTIVE$? ( $SINGULAR_NOUN$ | ( $PLURAL_NOUN$ <EoW><RB> ) ) [#ninfl#]? || $NINFL$

% Verbs
$VERB$ = $ASTEM$? $VSTEM$ [#vinfl#]? || $VINFL$

$WORD$ = $MISC$? ( $NOUN$* \
	| $VERB$* \
	| $INTERJECTION$ \
	| $QUESTION$ \
	| $NUMBER$ \
) $MISC$?

$WORD$
