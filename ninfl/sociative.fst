%
% FSTs for nominal Sociative inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP#] <sociative> <del> <pl>
% Sociative inflection rules
$sociative_virama$ = {<sociative>}:{ഓട്} ^-> ([#POS##BM##TMP#]+ __)
$sociative_samvruthokaram$ = {<sociative>}:{ഓടു്} ^-> ([#POS##BM##TMP#]+ __)
$sociative$ = $sociative_virama$ || $sociative_samvruthokaram$
$sociative$
