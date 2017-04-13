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

% Verbs
$VSTEM$ = "<lexicon/verbs.a>"
$VINFL$ = "<vinfl.a>"
% Numbers using digits
$Num$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)?  [#Perc#]?  <num><RB>

% Nouns
$NOUN$ = $JSTEM$?  ($NSTEM$ | $PRONSTEM$ | $CSTEM$ | $NUMBERS$ | $ABBREV$* $PNSTEM$ ) [#ninfl#]?  \
	|| $NINFL$

% Verbs
$VERB$ = $ASTEM$? $VSTEM$ [#vinfl#]? || $VINFL$

$WORD$ = ( $NOUN$ $NOUN$? \
	| $VERB$ $VERB$? \
	| $XSTEM$  \
	| $Num$ \
) $MISC$?

$WORD$
