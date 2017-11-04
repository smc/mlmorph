%
% FSTs for nominal genitive inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]

$genitive-special-cases$ = {ഞാൻ}:{എന്റെ} | \
    {ഞാൻ}:{എന്നുടെ} | \
    {നീ}:{നിന്റെ} | \
    {നീ}:{നിന്നുടെ} | \
    {താൻ}:{തന്റെ} | \
    {താൻ}:{തന്നുടെ} | \
    {നാം}:{നമ്മുടെ} | \
    {നാം}:{നമ്മളുടെ}

% Genitive inflection rules -ആനയുടെ, കടലിന്റെ, പേരിന്റെ, പൂച്ചയുടെ, മുറ്റത്തിന്റെ
% പൊതുവിൽ ചില്ലിൽ അവസാനിക്കുന്ന വാക്കുകൾക്ക് ഉടെ, ഇന്റെ എന്നീ രണ്ടും വിഭക്തികളും ചേരും. ഉദാഹരണം
% അവൻ = അവനുടെ, അവന്റെ, ആൾ = ആളുടെ, ആളിന്റെ,  വാൾ - വാളിന്റെ, വാളുടെ(?) ,
% കാൽ - കാലിന്റെ, കാലുടെ(?) , അവൾ = അവളുടെ, അവളിന്റെ(?)  അവർ - അവരുടെ, അവരിന്റെ(?)
% ഇതിൽ എല്ലാ രൂപങ്ങൾക്കും പ്രചാരമില്ല. അതുകൊണ്ട് ഏതെപ്പോൾ ചേർക്കണമെന്ന് കണ്ടുപിടിക്കേണ്ടിയിരിക്കുന്നു.
$genitive-cons-vowels$ = {<genitive>}:{യുടെ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$genitive-half-cons$ = {<genitive>}:{ഇന്റെ} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)

$genitive-anuswara-step1$ =  {<genitive>}:{<del>ത്തിന്റെ} ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
$genitive-anuswara-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##Numbers##TMP#]+ <del> )
$genitive-anuswara$ = $genitive-anuswara-step1$ || $genitive-anuswara-step2$

$genitive-exceptions-step1$ = $genitive-special-cases$ ^-> ( __ [#POS##BM##Numbers##TMP#]+ <genitive> )
$remove-genitive-ninfl$ = {<genitive>}:{} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$genitive-exceptions$ = $genitive-exceptions-step1$ || $remove-genitive-ninfl$

% ന്റെ = ന്+ റെ ആക്കാൻ ഇവിടെ ഒരു മാർക്കർ ഇട്ടുവെച്ച് ചില്ലു നോർമലൈസ് ചെയ്യുമ്പോൾ ഉപയോഗിക്കുന്നു.
$chillu-n-forms$ = {<genitive>}:{<del>റെ} | {<genitive>}:{ഉടെ}
$chillu-forms$ = {<genitive>}:{ഇന്റെ} | {<genitive>}:{ഉടെ}
$genitive-chillu-n$ = $chillu-n-forms$  ^-> ([ൻ] [#POS##BM##Numbers##TMP#]+ __)
$genitive-chillu-others$ = $chillu-forms$ ^-> ([ർൾൺൿൽ] [#POS##BM##Numbers##TMP#]+ __)

$genitive-cases$ = $genitive-cons-vowels$ |\
 	$genitive-half-cons$ |\
    $genitive-anuswara$ |\
	$genitive-chillu-n$ |\
	$genitive-chillu-others$

$genitive$ =  $genitive-cases$ | $genitive-exceptions$
$genitive$
