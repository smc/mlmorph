% malayalam.fst
%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"
#include "ninfl.fst"

%%% The stems from the lexicon (possibly with derivation)
$NSTEM$ = "<noun.a>"
$NUMBERS$ = "<num.a>"

$NOUN$ = $NSTEM$ $NINFL$?
$WORD$ =  $NUMBERS$ | $NOUN$ $NOUN$? $NOUN$?

%
% filter for the symbols that we do not want to see in the analysis
%

ALPHABET = [#Asym#] <>:[#TMP#] <>:[#BM#]
$afilter$ = .*

$afilter$ || <BoW> $WORD$ <EoW> || "<phon/phon.a>"
