%
% FSTs for nominal inflections
%

#include "symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#AAsym#]

%%%%% plural

$plural$ = <pl>:{കൾ} ^-> ([#POS##BM##Numbers##TMP#]* __)

% Vocative inflection rules- sambodhana - മരമേ, കാടേ, പൂച്ചേ, അവരേ, അവളേ, മലരേ, പട്ടികളേ, പട്ടീ
$vocative$ = {<vocative>}:{ഏ} ^-> ([#POS##BM##Numbers##TMP#]* __)

% Genitive inflection rules -ആനയുടെ, കടലിന്റെ, പേരിന്റെ, പൂച്ചയുടെ, മുറ്റത്തിന്റെ

$genitive-cons$ = {[<genitive>]}:{യുടെ} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]* __)
$genitive-half-cons$ = {[<genitive>]}:{ഇന്റെ} ^-> ([#Virama##Anuswara##Chillus#] [#POS##BM##Numbers##TMP#]* __)
$genitive$ = $genitive-cons$ || $genitive-half-cons$

% Locative inflection rules
$locative$ = {<locative>}:{ഇൽ} ^-> ([#POS##BM##Numbers##TMP#]* __)

% Sociative inflection rules
$sociative_virama$ = {<sociative>}:{ഓട്} ^-> ([#POS##BM##Numbers##TMP#]* __)
$sociative_samvruthokaram$ = {<sociative>}:{ഓടു്} ^-> ([#POS##BM##Numbers##TMP#]* __)
$sociative$ = $sociative_virama$ || $sociative_samvruthokaram$

% Instrumental inflection rules ആനയാൽ, വടിയാൽ, വടികൊണ്ട്
$instrumental-form-1$ = {<instrumental>}:{ആൽ} ^-> ([#POS##BM##Numbers##TMP#]* __)
$instrumental-form-2a$ = {<instrumental>}: {കൊണ്ട്} ^-> ([#POS##BM##Numbers##TMP#]* __)
$instrumental-form-2b$ = {<instrumental>}: {കൊണ്ടു്} ^-> ([#POS##BM##Numbers##TMP#]* __)
$instrumental$ = $instrumental-form-1$ || $instrumental-form-2a$ || $instrumental-form-2b$

% Accusative inflection rules കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ
$accusative-cons-vowels$ = {<accusative>}:{എ} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]* __)
$accusative-chillus$ = {<accusative>}:{ഇനെ} ^-> ([#Chillus##Virama#] [#POS##BM##Numbers##TMP#]* __)
$accusative$ = $accusative-cons-vowels$ || $accusative-chillus$

% Dative inflection rules മഴയ്ക്ക്, ഇലയ്ക്ക്, കാടിന്, വീടിന്
$dative-cons-form-1a$ = {<dative>}:{യ്ക്ക്} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]* __)
$dative-cons-form-1b$ = {<dative>}: {യ്ക്കു്} ^-> ([#Consonants#] [#POS##BM##Numbers##TMP#]* __)
$dative-cons-vowel-form-1a$ = {<dative>}: {ക്ക്} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]* __)
$dative-cons-vowel-form-1b$ = {<dative>}: {ക്കു്} ^-> ([#Consonants##VowelSigns#] [#POS##BM##Numbers##TMP#]* __)
$dative-virama-form-1a$ = {<dative>}: {ഇന്} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]* __)
$dative-virama-form-1b$ = {<dative>}: {ഇനു്} ^-> ([#Virama#] [#POS##BM##Numbers##TMP#]* __)
$dative$ = $dative-cons-form-1a$ || $dative-cons-form-1b$ \
	|| $dative-cons-vowel-form-1a$ 	|| $dative-cons-vowel-form-1b$ \
	|| $dative-virama-form-1a$ || $dative-virama-form-1b$

%$tests$ = ആന<n> | കടൽ<n> | പേര്<n>
$NINFL$ = $plural$ || $vocative$ || $genitive$ || $locative$ \
	|| $sociative$ || $instrumental$ || $dative$ || $accusative$

%$tests$ [#infl#] || $NINFL$
$NINFL$
