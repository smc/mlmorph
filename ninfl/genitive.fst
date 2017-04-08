%
% FSTs for nominal genitive inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]

% Genitive inflection rules -ആനയുടെ, കടലിന്റെ, പേരിന്റെ, പൂച്ചയുടെ, മുറ്റത്തിന്റെ
% പൊതുവിൽ ചില്ലിൽ അവസാനിക്കുന്ന വാക്കുകൾക്ക് ഉടെ, ഇന്റെ എന്നീ രണ്ടും വിഭക്തികളും ചേരും. ഉദാഹരണം
% അവൻ = അവനുടെ, അവന്റെ, ആൾ = ആളുടെ, ആളിന്റെ,  വാൾ - വാളിന്റെ, വാളുടെ(?) ,
% കാൽ - കാലിന്റെ, കാലുടെ(?) , അവൾ = അവളുടെ, അവളിന്റെ(?)  അവർ - അവരുടെ, അവരിന്റെ(?)
% ഇതിൽ എല്ലാ രൂപങ്ങൾക്കും പ്രചാരമില്ല. അതുകൊണ്ട് ഏതെപ്പോൾ ചേർക്കണമെന്ന് കണ്ടുപിടിക്കേണ്ടിയിരിക്കുന്നു.
$genitive-cons$ = {<genitive>}:{യുടെ} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$genitive-chillu-form1$ = {<genitive>}:{ഉടെ} ^-> ([#Chillus#] [#POS##BM##Numbers##TMP#]+ __)
$genitive-half-cons$ = {<genitive>}:{ഇന്റെ} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)
$genitive-anuswara$ =  {<genitive>}:{<del>ത്തിന്റെ} ^-> ([#Anuswara#] [#POS##BM##Numbers##TMP#]+ __)
% ന്റെ = ന്+ റെ ആക്കാൻ ഇവിടെ ഒരു മാർക്കർ ഇട്ടുവെച്ച് ചില്ലു നോർമലൈസ് ചെയ്യുമ്പോൾ ഉപയോഗിക്കുന്നു.
$genitive-chillu-n$ = {<genitive>}:{<del>റെ} ^-> ([ൻ] [#POS##BM##Numbers##TMP#]+ __)
$genitive-chillu-others$ = {<genitive>}:{ഇന്റെ} ^-> ([ർൾൺൿൽ] [#POS##BM##Numbers##TMP#]+ __)

$genitive-step1$ = $genitive-cons$ ||\
 	$genitive-half-cons$ ||\
    $genitive-anuswara$ ||\
	$genitive-chillu-n$ ||\
	$genitive-chillu-others$ ||\
	$genitive-chillu-form1$

% Post process steps
$genitive-step2$ = {[#Anuswara#]}:{} ^-> (__ [#POS##BM##Numbers##TMP#]+ <del> )

$genitive$ = $genitive-step1$ || $genitive-step2$
$genitive$
