%
% FSTs for nominal inflections - plurals
%

#include "../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Numbers#] <plural> <pl> <del>

%%%%% plural
% തലകൾ, തരങ്ങൾ, കാടുകൾ
$plural-maps$ = {[#Virama#]}:{ുകൾ<del>} | \
	{[#Anuswara#]}:{ങ്ങൾ<del>} | \
	{[ൻ]}:{ൻമാർ<del>} | \
	{[ൽ]}:{ലുകൾ<del>}  | \
	{[ൾ]}:{ളുകൾ<del>} | \
	{[ൺ]}:{ണുുകൾ<del>} | \
	{[ർ]}:{റുകൾ<del>} | \
	{[ർ]}:{രുകൾ<del>} | \
	{ഞാൻ}:{ഞങ്ങൾ<del>} | \
	{നീ}:{നിങ്ങൾ<del>}

$plural-general_step1$ = $plural-maps$ ^-> (__ [#POS##BM##TMP##Numbers#]+ <pl> )
$plural-del-tmp$ = {<pl>}:{} ^->  (<del> [#POS##BM##TMP##Numbers#]+ __ )
$plural-general$= $plural-general_step1$ || $plural-del-tmp$

% <plural> Marks need to insert to avoid phonological rules in boundaries.
% for example: പൂച്ച + കൾ = പൂച്ചകൾ and not പൂച്ചക്കൾ as in പൂച്ച + കല്ല് => പൂച്ചക്കല്ല്
$plural-cons-vowel$ = {<pl>}:{<plural>കൾ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##TMP#]+ __ )

$plural$ = $plural-general$ || $plural-cons-vowel$

% TODO
% മങ്കമാർ, അമ്മമാർ, പോലീസുകാർ...
$test$ = മല<n><pl> | അവൻ<n><pl> | മരം<n><pl> | ഇതൾ<n><pl> | മുകിൽ<n><pl> | പയർ<n><pl>
$test$ || $plural$ >> "plural-test.a"

$plural$
