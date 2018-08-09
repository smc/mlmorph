#include "../../symbols.fst"
%%%% Causative voice forms - പ്രയോജകക്രിയകൾ %%%%
% ഉദാഹരണം: ഉറങ്ങുക-ഉറക്കുക, എഴുതിക്കുക, പഠിപ്പിക്കുക, ഓടിക്കുക

ALPHABET = [#Letters##POS##TMP##infl#] [#BM#]:<>

% സചേതന കർമ്മകങ്ങളാണ് കൂടുതലും സ്പെഷ്യൽ കേസുകൾ
% NOTE: <infl_marker> prevent the same suffix change again in $causative-voice$
$special-cases$ = {കേൾക്കുക}:{കേൾപ്പിക്കു<infl_marker>ക} |\
	{നില്ക്കുക}:{നിറുത്തു<infl_marker>ക} |\
	{നിൽക്കുക}:{നിറുത്തു<infl_marker>ക} |\
	{വരുക}:{വരുത്തു<infl_marker>ക} |\
	{പരക്കുക}:{പരത്തു<infl_marker>ക} |\
	{ഇടുക}:{ഇടുവിക്കു<infl_marker>ക} |\
	{നടുക}:{നടുവിക്കു<infl_marker>ക} |\
	{വിടുക}:{വിടുവിക്കു<infl_marker>ക} |\
	{പാടുക}:{പാടിക്കു<infl_marker>ക} |\
	{പെടുക}:{പെടുത്തു<infl_marker>ക} |\
	{തിന്നുക}:{തീറ്റു<infl_marker>ക} |\
	{തറുക}:{തറിക്കു<infl_marker>ക} |\
	{പാറുക}:{പാറിക്കു<infl_marker>ക}
% ഓഷ്ഠ്യമായ അകാരം, ര, ല, ഴ  എന്നിവയിൽ അവസാനിക്കുന്ന അകാരിതധാതുക്കളിൽ “ത്ത്’ എന്ന പ്രത്യയം
% ചേർത്താലാണു പ്രയോജകരൂപം കിട്ടുക.
$verb-suffix-map$ = {രുക}:{ർത്തുക} | {ലുക}:{ത്തുക} | {ഴുക}:{ഴ്ത്തുക} | {ളുക}:{ത്തുക} |\
	{റുക}:{റ്റുക} |\
	{ങ്ങുക}:{ക്കുക} |\
	{ണുക}:{ട്ടുക} | {ണുക}:{ണിക്കുക} \
	{ടുക}:{ട്ടുക} | {ടുക}:{ടിക്കുക} |\
	{ക്കുക}:{പ്പിക്കുക} |\ % അടിക്കുക-അടിപ്പിക്കുക
	{ഴുതുക}:{ഴുതിക്കുക} |\
	{യുക}: {യ്ക്കുക} | {യുക}: {യിക്കുക} |\
	{ഴുകുക}: {ഴുക്കുക} % ഒഴുകുക-ഒഴുക്കുക

$causative-voice$ = $verb-suffix-map$ ^-> ( __ [<v>#BM##TMP#]+ <causative-voice> )
$causative-voice-ex$ = $special-cases$ ^-> (__ [<v>#BM##TMP#]+ <causative-voice> )

$causative-voice$ = $causative-voice-ex$ || $causative-voice$
$tests$ = പതറുക<v><RB><causative-voice>
$tests$ || $causative-voice$ >> "causative.test.a"

$causative-voice$ || .*
