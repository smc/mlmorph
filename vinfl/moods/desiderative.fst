% --------------------------------------------------------------------------------
% ==== desiderative Mood Forms ====
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]

$verb-suffix-map$ =	{ുക}:{ണമായിരുന്നു} | \ % More formal. വരണമായിരുന്നു, പോകണമായിരുന്നു, പാടണമായിരുന്നു
	{ുക}:{വേണമായിരുന്നു} | \ % വിധായകനുജ്ഞായകങ്ങളിൽ അനുപ്രയോഗധാതുവിനെ പ്രാക്പ്രയോഗധാതുവിൽനിന്നും വേർതിരിച്ചിട്ടു സ്വതന്ത്രമായിട്ടും പ്രയോഗിക്കാം. പോകവേണമായിരുന്നു
	{ുക}: {േണ്ടതായിരുന്നു} % Extremely formal. വരേണ്ടതായിരുന്നു.

$desiderative-mood$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <desiderative-mood>)

% Negative desiderative mood
$verb-suffix-map$ = {ുക}:{േണ്ടായിരുന്നു} | {ുക}:{വേണ്ടായിരുന്നു}
$desiderative-mood-neg$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <desiderative-neg-mood>)

$desiderative-mood$ | $desiderative-mood-neg$