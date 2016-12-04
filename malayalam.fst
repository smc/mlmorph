% malayalam.fst
%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"
#include "ninfl.fst"

%%% The stems from the lexicon (possibly with derivation)
$NSTEM$ = "<noun.a>"
$PRONSTEM$ = "<pron.a>"
$PNSTEM$ = "<prop.a>"
$ASTEM$ = "<adv.a>"
$JSTEM$ = "<adj.a>"
$VSTEM$ = "<verb.a>"
$CSTEM$ = "<conj.a>"
$XSTEM$ = "<interj.a>"
$NUMBERS$ = "<number.a>"
$DEM$ = "<dem.a>"
% these following contains exceptional cases fully analyzed in the
% lexicon.
$MISC$ = "<misc.a>"

% Numbers using digits
$Num$ = [#Digit#]+ (\, [#Digit#]*)? (\. [#Digit#]*)?  [#Perc#]?  <num><RB>

% Nouns
$NOUN$ = ($JSTEM$?)  ($NSTEM$ | $PRONSTEM$ | $NUMBERS$ | $PNSTEM$ ) ($CSTEM$? | $NINFL$?)

% Verbs
$VERB$ =  $VSTEM$

$WORD$ = ( $NOUN$ $NOUN$? \
	| $VERB$ \
	| $XSTEM$  \
	| $Num$ \
) $MISC$?

%
% filter for the symbols that we do not want to see in the analysis
%

ALPHABET = [#Asym#] <>:[#TMP#] <>:[#BM#]
$afilter$ = .*

$afilter$ || <BoW> $WORD$ <EoW> || "<phon/phon.a>"
