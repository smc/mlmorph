%
% FSTs for nominal inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

$NINFL$ = "<vocative.a>" | "<genitive.a>" | "<locative.a>" | "<sociative.a>" | "<instrumental.a>" | "<dative.a>" | "<accusative.a>"

%$tests$ = ആന<n> | കടൽ<n> | പേര്<n>
% $tests$ [#infl#] | $NINFL$

$NINFL$ || "<adjective.a>"
