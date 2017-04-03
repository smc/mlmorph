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
$VSTEM$ = "<lexicon/verbs.a>"
$CSTEM$ = "<lexicon/conjunctions.a>"
$XSTEM$ = "<lexicon/interjections.a>"
$NUMBERS$ = "<num.a>" <num><RB>
$DEM$ = "<lexicon/demonstrative-prenominal-base.a>"
$ABBREV$ = "<lexicon/abbreviations.a>"
% these following contains exceptional cases fully analyzed in the
% lexicon.
$MISC$ = "<lexicon/misc.a>"
$NINFL$ = "<ninfl/ninfl.a>"
% Numbers using digits
$Num$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)?  [#Perc#]?  <num><RB>

% Nouns
$NOUN$ = ($JSTEM$?)  ($NSTEM$ | $PRONSTEM$ | $CSTEM$ | $NUMBERS$ | $ABBREV$* $PNSTEM$ ) [#infl#]?  \
	|| $NINFL$

% Verbs
$VERB$ =  $VSTEM$

$WORD$ = ( $NOUN$ $NOUN$? \
	| $VERB$ \
	| $XSTEM$  \
	| $Num$ \
) $MISC$?

$WORD$
