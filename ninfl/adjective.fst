%
% FSTs for adjective inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% adjective Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#]

#inflboundary# = #POS##BM##TMP#

$adj-anuswara-delete$ = {[#Anuswara#]}:{} ^-> ([#Letters#]+ __ [#inflboundary#]+ <adj> )

$adj-anuswara-delete$

