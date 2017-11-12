%
% FSTs for nominal genitive inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP#] <genitive> <del> <pl>

$genitive-special-cases$ = {ഞാൻ}:{എന്റെ<del>} | \
    {ഞാൻ}:{എന്നുടെ<del>} | \
    {നീ}:{നിന്റെ<del>} | \
    {നീ}:{നിന്നുടെ<del>} | \
    {താൻ}:{തന്റെ<del>} | \
    {താൻ}:{തന്നുടെ<del>} | \
    {നാം}:{നമ്മുടെ<del>} | \
    {നാം}:{നമ്മളുടെ<del>}

% Genitive inflection rules -ആനയുടെ, കടലിന്റെ, പേരിന്റെ, പൂച്ചയുടെ, മുറ്റത്തിന്റെ
% പൊതുവിൽ ചില്ലിൽ അവസാനിക്കുന്ന വാക്കുകൾക്ക് ഉടെ, ഇന്റെ എന്നീ രണ്ടും വിഭക്തികളും ചേരും. ഉദാഹരണം
% അവൻ = അവനുടെ, അവന്റെ, ആൾ = ആളുടെ, ആളിന്റെ,  വാൾ - വാളിന്റെ, വാളുടെ(?) ,
% കാൽ - കാലിന്റെ, കാലുടെ(?) , അവൾ = അവളുടെ, അവളിന്റെ(?)  അവർ - അവരുടെ, അവരിന്റെ(?)
% ഇതിൽ എല്ലാ രൂപങ്ങൾക്കും പ്രചാരമില്ല. അതുകൊണ്ട് ഏതെപ്പോൾ ചേർക്കണമെന്ന് കണ്ടുപിടിക്കേണ്ടിയിരിക്കുന്നു.

$genitive-exceptions-step1$ = $genitive-special-cases$ ^-> ( __ [#POS##BM##TMP#]+ <genitive> )
$remove-genitive-ninfl$ = {<genitive>}:{} ^-> (<del> [#POS##BM##TMP#]+ __ )
$genitive-exceptions$ = $genitive-exceptions-step1$ || $remove-genitive-ninfl$
$genitive$ = $genitive-exceptions$

$genitive-cons-vowels$ = {<genitive>}:{യുടെ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##TMP#]+ __)
$genitive$ = $genitive$ || $genitive-cons-vowels$

$genitive-half-cons$ = {<genitive>}:{ഇന്റെ} ^-> ([#Virama#] [#POS##BM##TMP#]+ __)
$genitive$ = $genitive$ || $genitive-half-cons$

$genitive-anuswara-step1$ =  {<genitive>}:{<del>ത്തിന്റെ} ^-> ([#Anuswara#] [#POS##BM##TMP#]+ __)
$genitive-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##TMP#]+ <del> )
$genitive-anuswara$ = $genitive-anuswara-step1$ || $genitive-anuswara-step2$
$genitive$ = $genitive$ || $genitive-anuswara$ 

% ന്റെ = ന്+ റെ ആക്കാൻ ഇവിടെ ഒരു മാർക്കർ ഇട്ടുവെച്ച് ചില്ലു നോർമലൈസ് ചെയ്യുമ്പോൾ ഉപയോഗിക്കുന്നു.
$chillu-n-forms$ = {<genitive>}:{<del>റെ} | {<genitive>}:{ഉടെ}
$chillu-forms$ = {<genitive>}:{ഇന്റെ} | {<genitive>}:{ഉടെ}
$genitive-chillu-n$ = $chillu-n-forms$  ^-> ([ൻ] [#POS##BM##TMP#]+ __)
$genitive-chillu-others$ = $chillu-forms$ ^-> ([ർൾൺൿൽ] [#POS##BM##TMP#<pl>]+ __)
$genitive$ = $genitive$ || $genitive-chillu-n$ || $genitive-chillu-others$ 

%$tests$ = മഴ<n><RB><genitive> | മുറ്റം<n><RB><genitive> |  കിളി<n><RB><genitive> | താൻ<n><RB><genitive> | പയർ<n><genitive>
%$tests$ || $genitive$ >> "genitive-test.a"

$genitive$
