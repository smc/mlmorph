% --------------------------------------------------------------------------------
% ==== Imperative Mood Forms ====
% വിധായകം - അണമെന്നു വിധായകേ.
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##infl#]
$past-tense$ = "<../past.a>"

$verb-suffix-map$ = {ുക}:{ൂ} | {ിക}:{ൂ} | \ % Less formal. വരൂ, പോകൂ, പാടൂ
	{ുക}:{ണം} | \ % More formal. വരണം, പോകണം, പാടണം
	{ുക}:{േണം} | \ % ചിരിക്കേണം
	{ുക}:{വേണം} | \ % വിധായകനുജ്ഞായകങ്ങളിൽ അനുപ്രയോഗധാതുവിനെ പ്രാക്പ്രയോഗധാതുവിൽനിന്നും വേർതിരിച്ചിട്ടു സ്വതന്ത്രമായിട്ടും പ്രയോഗിക്കാം. പോകവേണം
	{ുക}: {േണ്ടതാണ്} | \ % Extremely formal. വരേണ്ടതാണ്, പോകേണ്ടതാണ്, പാടേണ്ടതാണ്.
	{ുക}: {്} | \ % കേൾക്ക്, പാട്
	{ുക}: {ുവിൻ} |\ % പോകുവിൻ, പാടുവിൻ
	{ുക}: {ിൻ} |\ % പോകിൻ, ചിരിക്കിൻ
	{ിക്കുക}:{ിപ്പിൻ} |\ % ചിരിപ്പിൻ, ഇരിപ്പിൻ
	{ുക്കുക}:{ുപ്പിൻ} % കൊടുപ്പിൻ

$imperative-mood-1$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <imperative-mood>)

$verb-suffix-del$ = {ക്കുക}: {} | \ % കേൾ
	{ക്കുക}: {ക്ക} | \ % കേൾക്ക
	{യുക}: {യ്} % പറയ് തുഴയ്
$imperative-mood-2$ = $verb-suffix-del$  <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##TMP#]+ <imperative-mood>)

$verb-suffix-map-2$ = {ി<infl_marker>} : {ക്കോണം<infl_marker>}  | \ % ചാടിക്കോണം
	{ി<infl_marker>} : {ിയേക്കണം<infl_marker>} | \ % ചാടിയേക്കണം
	{ു<infl_marker>} : {േ<infl_marker>} | \  % തിന്നേ, തന്നേ, ചിരിച്ചേ
	{ു<infl_marker>} : {േക്കണം<infl_marker>} | \  % തിന്നേക്കണം, തന്നേക്കണം
	{ു<infl_marker>} : {ോണം<infl_marker>} % തിന്നോണം, തന്നോണം, മറന്നോണം

% We need to wrap the verb into past form first. For that, fake a past tag and pass
% it through the past.a. Only when the input has <imperative-mood> at end.
$fake-past$ = {<RB>}:{<past>} ^-> ([#verbs#]+ __ [<imperative-mood>])
$remove-past$ = <past>:<RB> ^-> ([#verbs#]+ __ [<imperative-mood>])
$imperative-mood-3$ = $verb-suffix-map-2$ ^-> ([#Consonants#]+ __ [#BM##TMP##verbs#<past>]+ <imperative-mood>)
$imperative-mood-3$ = $fake-past$ || $past-tense$ || $imperative-mood-3$ || $remove-past$

$special_cases$ = {വരുക} : {വാ} | {വരിക} :{വാ} | {തരുക}:{താ} | {തരിക}:{താ} | {പോകുക} : {പോ}
$imperative-mood-ex$ = $special_cases$ <>:<infl_marker> ^-> ( __ [#POS##BM##TMP#]+ <imperative-mood>)

$imperative-mood-ex$ || ( $imperative-mood-1$ | $imperative-mood-2$ | $imperative-mood-3$ )
