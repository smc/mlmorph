%
% FSTs for nominal Instrumental inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
% Instrumental inflection rules ആനയാൽ, വടിയാൽ, വടികൊണ്ട്
$instrumental-form-1$ = {<instrumental>}:{ആൽ} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$instrumental-form-2a$ = {<instrumental>}:{<ninfl>കൊണ്ട്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$instrumental-form-2b$ = {<instrumental>}:{<ninfl>കൊണ്ടു്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$instrumental$ = $instrumental-form-1$ || $instrumental-form-2a$ || $instrumental-form-2b$

$instrumental$
