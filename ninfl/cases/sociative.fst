%
% FSTs for nominal Sociative inflections
%

#include "../../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <sociative> <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

% Sociative inflection rules
$sociative_general_forms$ = {<sociative>}:{ഓട്<infl_marker>} | {<sociative>}:{ഓടു്<infl_marker>} | {<sociative>}:{ഓടു<infl_marker>}
$sociative_general$ = $sociative_general_forms$ ^-> ([#Consonants##Chillus##VowelSigns##Virama#] [#inflboundary#]+ __)
$sociative_virama_forms$ = {<sociative>}:{ഇനോട്<infl_marker>} | {<sociative>}:{ഇനോടു്<infl_marker>} | {<sociative>}:{ഇനോടു<infl_marker>}
$sociative_virama$ = $sociative_virama_forms$ ^-> ([#Virama#] [#inflboundary#]+ __)

$sociative$ = $sociative_general$ | $sociative_virama$
$sociative$
