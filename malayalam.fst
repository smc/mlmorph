% malayalam.fst
%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"
#include "ninfl.fst"

%%% The stems from the lexicon (possibly with derivation)
$NSTEM$ = "<noun.a>" | "<pron.a>"
$PNSTEM$ = "<prop.a>"
$ASTEM$ = "<adv.a>"
$JSTEM$ = "<adj.a>"
$VSTEM$ = "<verb.a>"
$CSTEM$ = "<conj.a>"
$XSTEM$ = "<interj.a>"
$NUMBERS$ = "<num.a>"

% these following contains exceptional cases fully analyzed in the
% lexicon.
$MISC$ = "<misc.a>"

$NOUN$ = ($NSTEM$ | $NUMBERS$ | $PNSTEM$) $NINFL$? | \
		$XSTEM$ |\
		$CSTEM$
$WORD$ =  $NOUN$ $NOUN$?

%
% filter for the symbols that we do not want to see in the analysis
%

ALPHABET = [#Asym#] <>:[#TMP#] <>:[#BM#]
$afilter$ = .*

$afilter$ || <BoW> $WORD$ <EoW> || "<phon/phon.a>"
