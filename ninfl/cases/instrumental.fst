%
% FSTs for nominal Instrumental inflections
%

#include "../../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]
$instrumental-forms$ = {<instrumental>}:{ആൽ<infl_marker>} | \
	{<instrumental>}:{<ninfl>യെക്കൊണ്ട്<infl_marker>} | \
	{<instrumental>}:{<ninfl>യെക്കൊണ്ടു്<infl_marker>} | \
	{<instrumental>}:{<ninfl>കൊണ്ട്<infl_marker>} | \
	{<instrumental>}:{<ninfl>കൊണ്ടു്<infl_marker>}
% Instrumental inflection rules ആനയാൽ, ആനകൊണ്ട്, ആനയെക്കൊണ്ട്, വടിയാൽ, വടികൊണ്ട്, വട്ടിയെക്കൊണ്ട്
$instrumental$  = $instrumental-forms$ ^-> ([#POS##BM##Numbers##TMP##Numbers#]+ __)
$instrumental$
