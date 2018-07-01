%
% FSTs for nominal Sociative inflections
%

#include "../../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <sociative> <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

% Sociative inflection rules
$sociative_form_1$ = {<sociative>}:{ഓട്<infl_marker>} ^-> ([#Consonants##Chillus##VowelSigns##Virama#] [#inflboundary#]+ __)
$sociative_form_2$ = {<sociative>}:{ഓടു്} ^-> ([#Consonants##Chillus##VowelSigns##Virama#] [#inflboundary#]+ __)
$sociative_form_3$ = {<sociative>}:{ഇനോട്<infl_marker>} ^-> ([#Virama#] [#inflboundary#]+ __)
$sociative_form_4$ = {<sociative>}:{ഇനോടു്} ^-> ([#Virama#] [#inflboundary#]+ __)

$sociative$ = $sociative_form_1$ | $sociative_form_2$ | $sociative_form_3$ | $sociative_form_4$
$sociative$
