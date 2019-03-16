%
% FSTs for nominal genitive inflections
%

#include "../../symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym#] <genitive> <infl_marker> <pl> <del>

#inflboundary# = #POS##BM##TMP##Lsym#

$genitive-special-cases$ = {ഞാൻ}:{എന്റെ<infl_marker>} | \
    {ഞാൻ}:{എന്നുടെ<infl_marker>} | \
    {അവർ}:{അവരുടെ<infl_marker>} | \
    {നീ}:{നിന്റെ<infl_marker>} | \
    {നീ}:{നിന്നുടെ<infl_marker>} | \
    {താൻ}:{തന്റെ<infl_marker>} | \
    {താൻ}:{തന്നുടെ<infl_marker>} | \
    {നാം}:{നമ്മുടെ<infl_marker>} | \
    {നാം}:{നമ്മളുടെ<infl_marker>}

$genitive-del$ = {[#Anuswara#ൻർ]}:{} ^-> (__ [#inflboundary# ]+ <del> )

% Genitive inflection rules -ആനയുടെ, കടലിന്റെ, പേരിന്റെ, പൂച്ചയുടെ, മുറ്റത്തിന്റെ
% പൊതുവിൽ ചില്ലിൽ അവസാനിക്കുന്ന വാക്കുകൾക്ക് ഉടെ, ഇന്റെ എന്നീ രണ്ടും വിഭക്തികളും ചേരും. ഉദാഹരണം
% അവൻ = അവനുടെ, അവന്റെ, ആൾ = ആളുടെ, ആളിന്റെ,  വാൾ - വാളിന്റെ, വാളുടെ(?) ,
% കാൽ - കാലിന്റെ, കാലുടെ(?) , അവൾ = അവളുടെ, അവളിന്റെ(?)
% ഇതിൽ എല്ലാ രൂപങ്ങൾക്കും പ്രചാരമില്ല. അതുകൊണ്ട് ഏതെപ്പോൾ ചേർക്കണമെന്ന് കണ്ടുപിടിക്കേണ്ടിയിരിക്കുന്നു.

$genitive-exceptions-step1$ = $genitive-special-cases$ ^-> ( __ [#inflboundary#]+ <genitive> )
$remove-genitive-ninfl$ = {<genitive>}:{} ^-> (<infl_marker> [#inflboundary#]+ __ )
$genitive-exceptions$ = $genitive-exceptions-step1$ || $remove-genitive-ninfl$
$genitive$ = $genitive-exceptions$

$genitive-cons-vowels$ = {<genitive>}:{യുടെ<infl_marker>} ^-> ([#Consonants#ാ ി ീ െ ൈ ോ ൊ ] [#inflboundary#]+ __)
$genitive$ = $genitive$ || $genitive-cons-vowels$

$genitive-half-cons$ = {<genitive>}:{ഇന്റെ<infl_marker>} ^-> ([#Virama#ു ൗ ൌ ] [#inflboundary#]+ __)
$genitive$ = $genitive$ || $genitive-half-cons$

$genitive-anuswara-1$ =  {<genitive>}:{<del>ത്തിന്റെ<infl_marker>} ^-> ([#Consonants#] [#Anuswara#] [#inflboundary#]+ __)
$genitive-anuswara-2$ =  {<genitive>}:{ഇന്റെ<infl_marker>} ^-> ([#VowelSigns#] [#Anuswara#] [#inflboundary#]+ __)
$genitive-anuswara$ = $genitive-anuswara-1$ || $genitive-anuswara-2$ || $genitive-del$
$genitive$ = $genitive$ || $genitive-anuswara$

% ൻ - ന്റെ ആവുന്നു. നുടെ എന്നുമാകാം. ഭടൻ - ഭടന്റെ, ഭടനുടെ
$genitive-chillu-n-forms$ = {<genitive>}:{<del>ന്റെ<infl_marker>} | {<genitive>}:{ഉടെ<infl_marker>}
$genitive-chillu-n$ = $genitive-chillu-n-forms$ ^-> ([ൻ] [#inflboundary#]+ __)
$genitive-chillu-n$ = $genitive-chillu-n$ || $genitive-del$

% ർ - രിന്റെ, റിന്റെ എന്നിവയിലേതെങ്കിലുമാവാം. കാറിന്റെ, തൃശ്ശൂരിന്റെ, തരൂരിന്റെ ...
% രിന്റെ എന്നത് ചില്ലുകളുടെ പൊതുവെയുള്ള നിയമത്തിൽ ചെയ്തുകൊള്ളും. താഴെ നോക്കുക.
% റിന്റെ എന്നു വരുവാൻ പ്രത്യേക നിയമം ചേർക്കുന്നു.
$genitive-chillu-r$ = {<genitive>}: {<del>റിന്റെ<infl_marker>} ^-> ([ർ] [#inflboundary# ]+ __)
$genitive-chillu-r$ = $genitive-chillu-r$ || $genitive-del$

$chillu-forms$ = {<genitive>}:{ഇന്റെ<infl_marker>} | {<genitive>}:{ഉടെ<infl_marker>}
$genitive-chillu-others$ = $chillu-forms$ ^-> ([ർൾൺൿൽ] [#inflboundary#<pl>]+ __)
$genitive$ = $genitive$ | $genitive-chillu-n$ | $genitive-chillu-r$ | $genitive-chillu-others$

%$tests$ = മഴ<n><RB><genitive> | മുറ്റം<n><RB><genitive> |  കിളി<n><RB><genitive> | താൻ<n><RB><genitive> | പയർ<n><genitive>
%$tests$ || $genitive$ >> "genitive-test.a"

$genitive$
