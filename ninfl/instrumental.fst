%
% FSTs for nominal Instrumental inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
$instrumental-forms$ = {<instrumental>}:{ആൽ} | \
	{<instrumental>}:{<ninfl>കൊണ്ട്} | \
	{<instrumental>}:{<ninfl>കൊണ്ടു്}
% Instrumental inflection rules ആനയാൽ, വടിയാൽ, വടികൊണ്ട്
$instrumental$  = $instrumental-forms$ ^-> ([#POS##BM##Numbers##TMP#]+ __)
$instrumental$
