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
$plural-cons-vowel$ = {<pl>}:{<plural>കൾ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __ )
$plural-del-tmp$ = {<pl>}:{} ^->  ([#POS##BM##Numbers##TMP#]+ __ )
$plural$ = $plural-general$ || $plural-cons-vowel$ || $plural-del-tmp$

% TODO
% മങ്കമാർ, അമ്മമാർ, പോലീസുകാർ...
$test$ = മല<n><pl> | അവൻ<n><pl> | മരം<n><pl> | ഇതൾ<n><pl> | മുകിൽ<n><pl>
%$test$ || \
$plural$
