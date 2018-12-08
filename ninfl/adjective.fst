%
% FSTs for adjective inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% adjective Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers##compounds#] <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Numbers#

$adj-anuswara-delete$ = {[#Anuswara#]}:{} ^-> ([#Letters#]+ __ [#inflboundary#]+ <adj> )

#=EC# = #Consonants#
$EC$ = {[#=EC#]}:{[#=EC#][ാ]}
$adj-a-vowel-elongation$ = $EC$ ^-> (__ <sanskrit> [#inflboundary#]+ <adj> )

$adj-i-vowel-elongation$ =( {ി}:{ീ} ) ^-> ([#Consonants#] __ <sanskrit> [#inflboundary#]+ <adj> )

$adj$ = $adj-anuswara-delete$ || $adj-a-vowel-elongation$ || $adj-i-vowel-elongation$

$tests$ = ആശ<n><sanskrit><RB><adj> | യുവതി<n><sanskrit><RB><adj>
$tests$ || $adj$ >> "adjective.test.a"

$adj$