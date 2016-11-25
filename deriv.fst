%
% FST to handle all derivational process
%

#include "symbols.fst"
#include "ninfl.fst"

$NSTEM$ =  "lexicon/nouns.lex" <n><RB>

%%%%%%%%%%%%%%%%%%%%% Write the FSTs

$NSTEM$  >> "noun.a"

% This is for testing. Individual files are already written to
% correspondign FSA already.

<>:<BoW> ( $NSTEM$ ) <>:<EoW> || "<phon/phon.a>"
