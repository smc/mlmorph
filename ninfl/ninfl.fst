%
% FSTs for nominal inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]

%$tests$ = ആന<n> | കടൽ<n> | പേര്<n>
$NINFL$ = "<plural.a>" |\
 	"<vocative.a>" |\
	"<genitive.a>" |\
	"<locative.a>" |\
	"<sociative.a>" |\
	"<instrumental.a>" |\
	"<dative.a>" |\
	"<accusative.a>"

%$tests$ [#infl#] | $NINFL$
$NINFL$
