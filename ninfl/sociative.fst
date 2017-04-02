%
% FSTs for nominal Sociative inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
% Sociative inflection rules
$sociative_virama$ = {<sociative>}:{ഓട്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$sociative_samvruthokaram$ = {<sociative>}:{ഓടു്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$sociative$ = $sociative_virama$ || $sociative_samvruthokaram$
$sociative$
