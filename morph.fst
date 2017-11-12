%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"

%%% The stems from the lexicon (possibly with derivation)
$NSTEM$ = "<lexicon/nouns.a>"
$PRONSTEM$ = "<lexicon/pronouns.a>"
$PNSTEM$ = "<lexicon/proper-nouns.a>"
$ASTEM$ = "<lexicon/adverbs.a>"
$JSTEM$ = "<lexicon/adjectives.a>"
$CSTEM$ = "<lexicon/conjunctions.a>"
$XSTEM$ = "<lexicon/interjections.a>"
$NUMBERS$ = "<num.a>" <num><RB>
$DEM$ = "<lexicon/demonstrative-prenominal-base.a>"
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
$Num$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)?  [#Perc#]?  <num><RB>

% Nouns
$SINGULAR_NOUN$ = $NSTEM$ | $PRONSTEM$ | $CSTEM$ | $NUMBERS$ | $ABBREV$* $PNSTEM$ 
$PLURAL_NOUN$ = $SINGULAR_NOUN$ <pl> || $PLURAL$

$NOUN$ = $JSTEM$? ( $SINGULAR_NOUN$ | $PLURAL_NOUN$ <EoW><RB> ) [#ninfl#]? || $NINFL$

% Verbs
$VERB$ = $ASTEM$? $VSTEM$ [#vinfl#]? || $VINFL$

$WORD$ = $MISC$? ( $NOUN$ $NOUN$? \
	| $VERB$ $VERB$? \
	| $XSTEM$  \
	| $Num$ \
) $MISC$?

$WORD$
