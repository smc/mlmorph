%
% FSTs for nominal inflections
%

#include "symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]

% Vocative inflection rules- sambodhana - മരമേ, കാടേ, പൂച്ചേ, അവരേ, അവളേ, മലരേ, പട്ടികളേ, പട്ടീ
$vocative$ = {<vocative>}:{ഏ} ^-> ([#POS##BM##Numbers##TMP#]* __)

% Genitive inflection rules -ആനയുടെ, കടലിന്റെ, പേരിന്റെ, പൂച്ചയുടെ, മുറ്റത്തിന്റെ
% പൊതുവിൽ ചില്ലിൽ അവസാനിക്കുന്ന വാക്കുകൾക്ക് ഉടെ, ഇന്റെ എന്നീ രണ്ടും വിഭക്തികളും ചേരും. ഉദാഹരണം
% അവൻ = അവനുടെ, അവന്റെ, ആൾ = ആളുടെ, ആളിന്റെ,  വാൾ - വാളിന്റെ, വാളുടെ(?) ,
% കാൽ - കാലിന്റെ, കാലുടെ(?) , അവൾ = അവളുടെ, അവളിന്റെ(?)  അവർ - അവരുടെ, അവരിന്റെ(?)
% ഇതിൽ എല്ലാ രൂപങ്ങൾക്കും പ്രചാരമില്ല. അതുകൊണ്ട് ഏതെപ്പോൾ ചേർക്കണമെന്ന് കണ്ടുപിടിക്കേണ്ടിയിരിക്കുന്നു.
$genitive-cons$ = {<genitive>}:{യുടെ} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$genitive-chillu-form1$ = {<genitive>}:{ഉടെ} ^-> ([#Chillus#] [#POS##BM##Numbers##TMP#]+ __)
$genitive-half-cons$ = {<genitive>}:{ഇന്റെ} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)
% ന്റെ = ന്+ റെ ആക്കാൻ ഇവിടെ ഒരു മാർക്കർ ഇട്ടുവെച്ച് ചില്ലു നോർമലൈസ് ചെയ്യുമ്പോൾ ഉപയോഗിക്കുന്നു.
$genitive-chillu-n$ = {<genitive>}:{<del>റെ} ^-> ([ൻ] [#POS##BM##Numbers##TMP#]+ __)
$genitive-chillu-others$ = {<genitive>}:{ഇന്റെ} ^-> ([ർൾൺൿൽ] [#POS##BM##Numbers##TMP#]+ __)
$genitive$ = $genitive-cons$ | $genitive-half-cons$ | $genitive-chillu-n$
% commented to save from frozen compilation | $genitive-chillu-others$ | $genitive-chillu-form1$

% Locative inflection rules
$locative$ = {<locative>}:{ഇൽ} ^-> ([#POS##BM##Numbers##TMP#]+ __)

% Sociative inflection rules
$sociative_virama$ = {<sociative>}:{ഓട്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$sociative_samvruthokaram$ = {<sociative>}:{ഓടു്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$sociative$ = $sociative_virama$ | $sociative_samvruthokaram$

% Instrumental inflection rules ആനയാൽ, വടിയാൽ, വടികൊണ്ട്
$instrumental-form-1$ = {<instrumental>}:{ആൽ} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$instrumental-form-2a$ = {<instrumental>}:{<ninfl>കൊണ്ട്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$instrumental-form-2b$ = {<instrumental>}:{<ninfl>കൊണ്ടു്} ^-> ([#POS##BM##Numbers##TMP#]+ __)
$instrumental$ = $instrumental-form-1$ | $instrumental-form-2a$ | $instrumental-form-2b$

% Accusative inflection rules കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ
$accusative-cons-vowels$ = {<accusative>}:{എ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$accusative-chillus$ = {<accusative>}:{ഇനെ} ^-> ([#Chillus##Virama#] [#POS##BM##Numbers##TMP#]+ __)
$accusative$ = $accusative-cons-vowels$ | $accusative-chillus$

% Dative inflection rules മഴയ്ക്ക്, ഇലയ്ക്ക്, കാടിന്, വീടിന്
$dative-cons-form-1a$ = {<dative>}:{യ്ക്ക്} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$dative-cons-form-1b$ = {<dative>}:{യ്ക്കു്} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]+ __)
$dative-cons-vowel-form-1a$ = {<dative>}:{<ninfl>ക്ക്} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$dative-cons-vowel-form-1b$ = {<dative>}:{<ninfl>ക്കു്} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]+ __)
$dative-virama-form-1a$ = {<dative>}: {ഇന്} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)
$dative-virama-form-1b$ = {<dative>}: {ഇനു്} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]+ __)
$dative$ = $dative-cons-form-1a$ | $dative-cons-form-1b$ \
	| $dative-cons-vowel-form-1a$ | $dative-cons-vowel-form-1b$ \
	| $dative-virama-form-1a$ | $dative-virama-form-1b$

%$tests$ = ആന<n> | കടൽ<n> | പേര്<n>
$NINFL$ = "<plural.a>" | $vocative$ | $genitive$ | $locative$ \
	| $sociative$ | $instrumental$ | $dative$ | $accusative$

%$tests$ [#infl#] || $NINFL$
$NINFL$
