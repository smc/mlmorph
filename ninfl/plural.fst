%
% FSTs for nominal inflections - plurals
%

#include "../symbols.fst"

ALPHABET = [#AAsym#]

%%%%% plural
% തലകൾ, തരങ്ങൾ, കാടുകൾ
$plural-maps$ = {[#Virama#]}:{ുകൾ} | \
	{[#Anuswara#]}:{ങ്ങൾ} | \
	{[ൻ]}:{ൻമാർ} | \
	{[ൽ]}:{ലുകൾ}  | \
	{[ൾ]}:{ളുകൾ} | \
	{[ൺ]}:{ണുുകൾ} | \
	{[ർ]}:{റുകൾ} | \
	{[ർ]}:{രുകൾ}

$plural-general$ = $plural-maps$ ^-> (__ [#POS##BM##Numbers##TMP#]+ <pl> )

% <plural> Marks need to insert to avoid phonological rules in boundaries. 
% for example: പൂച്ച + കൾ = പൂച്ചകൾ and not പൂച്ചക്കൾ as in പൂച്ച + കല്ല് => പൂച്ചക്കല്ല്
$plural-cons-vowel$ = {<pl>}:{<plural>കൾ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __ )
$plural-del-tmp$ = {<pl>}:{} ^->  ([#POS##BM##Numbers##TMP#]+ __ )
$plural$ = $plural-general$ || $plural-cons-vowel$ || $plural-del-tmp$

% TODO
% മങ്കമാർ, അമ്മമാർ, പോലീസുകാർ...
$test$ = മല<n><pl> | അവൻ<n><pl> | മരം<n><pl> | ഇതൾ<n><pl> | മുകിൽ<n><pl>
%$test$ || \
$plural$
