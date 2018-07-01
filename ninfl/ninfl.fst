%
% FSTs for nominal inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

$NINFL$ = "<cases/cases.a>" || "<adjective.a>"

%$tests$ = ആന<n> | കടൽ<n> | പേര്<n>
% $tests$ [#infl#] | $NINFL$

$NINFL$
