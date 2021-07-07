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
$sociative_forms$ = {<sociative>}:{ഇനോട്<infl_marker>} | {<sociative>}:{ഇനോടു്<infl_marker>} | {<sociative>}:{ഇനോടു<infl_marker>}
$sociative$ = $sociative_forms$ ^-> ([#Virama#] [#inflboundary#]+ __)

$sociative-anuswara-1-forms$ = {<sociative>}:{<del>ത്തിനോട്<infl_marker>} | \
     {<sociative>}:{<del>ത്തോട്<infl_marker>} | \
     {<sociative>}:{<del>ത്തോടു<infl_marker>} | \
     {<sociative>}:{<del>ത്തോടു്<infl_marker>} | \
     {<sociative>}:{<del>ത്തിനോടു<infl_marker>} | \
     {<sociative>}:{<del>ത്തിനോടു്<infl_marker>}
$sociative-anuswara-1$ = $sociative-anuswara-1-forms$ ^-> ([#Consonants#] [#Anuswara#] [#inflboundary#]+ __)
$sociative-anuswara-2-forms$ = {<sociative>}:{ഇനോട്<infl_marker>} | \
    {<sociative>}:{ഇനോടു<infl_marker>} | \
    {<sociative>}:{ഇനോടു്<infl_marker>}

$sociative-anuswara-2$ = $sociative-anuswara-2-forms$ ^-> ([#VowelSigns#] [#Anuswara#] [#inflboundary#]+ __)
$sociative-anuswara-del$ = {[#Anuswara#]}:{} ^-> (__ [#inflboundary# ]+ <del> )

$sociative-anuswara$ = $sociative-anuswara-1$ || $sociative-anuswara-2$ || $sociative-anuswara-del$

$sociative$ = $sociative_general$ | $sociative$ | $sociative-anuswara$
$sociative$
