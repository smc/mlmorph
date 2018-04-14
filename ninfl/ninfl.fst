%
% FSTs for nominal inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

%$tests$ = ആന<n> | കടൽ<n> | പേര്<n>
$NINFL$ = "<vocative.a>" | "<genitive.a>" | "<locative.a>" | "<sociative.a>"
$NINFL$ >> "ninfl.1.a"
 
$NINFL$ = "<instrumental.a>" | "<dative.a>" | "<accusative.a>" | "<adjective.a>"
$NINFL$ >> "ninfl.2.a"

% $tests$ [#infl#] | $NINFL$
"<ninfl.1.a>" | "<ninfl.2.a>"
