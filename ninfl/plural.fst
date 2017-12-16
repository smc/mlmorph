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
$plural-del-tmp$ = {<pl>}:{} ^-> (<del> [#POS##BM##TMP##Numbers#]+ __ )
$plural-general$= $plural-general_step1$ || $plural-del-tmp$

% ഉ, ഊ എന്നിവയൊഴികെയുള്ള സ്വരചിഹ്നങ്ങളിലോ, ഖരാക്ഷരങ്ങളിലോ അവസാനിക്കുന്നവയുടെ കൂടെ കൾ ചേർത്താൽ
% ബഹുവചനം കിട്ടും. ഈ കൾ-ലെ ക ഫോണോളജിക്കൽ നിയമങ്ങളിൽ നിന്ന് വിട്ട് നിൽക്കണം.
% ഉ, ഊ എന്നിവയുടെ ചിഹ്നങ്ങളിലാണവസാനിക്കുന്നതെങ്കിൽ ക്കൾ ആണ് ബഹുവചനം കിട്ടാനായി ചേർക്കേണ്ടതു്.

% <plural> Marks need to insert to avoid phonological rules in boundaries.
% for example: പൂച്ച + കൾ = പൂച്ചകൾ and not പൂച്ചക്കൾ as in പൂച്ച + കല്ല് => പൂച്ചക്കല്ല്
#VowelSigns-except-u# = ാിീെേൊോൗോൌൃ
$plural-cons-vowel$ = {<pl>}:{<plural>കൾ} ^-> ([#Consonants##VowelSigns-except-u#] [#POS##BM##TMP#]+ __ )
% പശു - പശുക്കൾ, ഗുരു-ഗുരുക്കൾ
$plural-u-vowelsign$ = {<pl>}:{<plural>ക്കൾ} ^-> ([ുൂ] [#POS##BM##TMP#]+ __ )

$plural$ = $plural-general$ | $plural-cons-vowel$ | $plural-u-vowelsign$

% TODO
% മങ്കമാർ, അമ്മമാർ, പോലീസുകാർ...
$test$ = മല<n><pl> | അവൻ<n><pl> | മരം<n><pl> | ഇതൾ<n><pl> | മുകിൽ<n><pl> | പയർ<n><pl>
$test$ || $plural$ >> "plural-test.a"

$plural$
