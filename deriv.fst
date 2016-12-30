%
% FST to handle all derivational process
%

#include "symbols.fst"
#include "ninfl.fst"

$NSTEM$ = "lexicon/nouns.lex" <n><RB>
$ASTEM$ = "lexicon/adverbs.lex" <adv><RB>
$CSTEM$ = "lexicon/conjunctions.lex" <cnj><RB>
$JSTEM$ = "lexicon/adjectives.lex" <adj><RB>
$MSTEM$ = "<num.a>" <num><RB>
$PNSTEM$ = "lexicon/proper_nouns.lex" | \
	"lexicon/person_names.lex"  | \
	"lexicon/times.lex" |\
	"lexicon/places.lex"  <np><RB>
% $PSTEM$ = "lexicon/postpositions" <postp><RB>
$RSTEM$ = "lexicon/pronouns.lex" <prn><RB>
$VSTEM$ = "lexicon/verbs.lex" <v><RB>
$XSTEM$ = "lexicon/interjections.lex" <ij><RB>
$DEM$ = "lexicon/demonstrative-prenominal-base.lex" <dem><RB>
$MISC$ = "lexicon/misc.lex"

%%%%%%%%%%%%%%%%%%%%% Write the FSTs

$NSTEM$ >> "noun.a"
$PNSTEM$ >> "prop.a"
$RSTEM$ >> "pron.a"
$JSTEM$ >> "adj.a"
$DEM$ >> "dem.a"
$ASTEM$ >> "adv.a"
% $PSTEM$ >> "postp.a"
$XSTEM$ >> "interj.a"
$CSTEM$ >> "conj.a"
$VSTEM$ >> "verb.a"
$MSTEM$ >> "number.a"
$MISC$ >> "misc.a"

% This is for testing. Individual files are already written to
% correspondign FSA already.

<>:<BoW> ($NSTEM$ |\
 $PNSTEM$|\
 $RSTEM$ |\
 $JSTEM$ |\
 $ASTEM$ |\
 $DEM$  |\
% $PSTEM$ |\
 $XSTEM$ |\
 $CSTEM$ |\
 $MISC$ |\
 $VSTEM$ |\
 $MSTEM$ ) <>:<EoW> || "<phon/phon.a>"
