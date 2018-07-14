% --------------------------------------------------------------------------------
% ==== Imperative Mood Forms ====
% വിധായകം - അണമെന്നു വിധായകേ.
% --------------------------------------------------------------------------------

#include "../../symbols.fst"

ALPHABET = [#AAsym#]
$special_cases$ = {വരുക} : {വാ} | {വരിക} :{വാ} | {തരുക}:{താ} | {തരിക}:{താ} | {പോകുക} : {പോ}

$verb-suffix-map$ = {ുക}:{ൂ} | {ിക}:{ൂ} | \ % Less formal. വരൂ, പോകൂ, പാടൂ
	{ുക}:{ണം} | {ുക}:{േണം} | \ % More formal. വരണം, പോകണം, പാടണം
	{ുക}: {േണ്ടതാണ്} | \ % Extremely formal. വരേണ്ടതാണ്, പോകേണ്ടതാണ്, പാടേണ്ടതാണ്.
	{ുക}: {} | \ % കേൾക്ക
	{ുക}: {്} | \ % കേൾക്ക്, പാട്
	{ുക}: {ുവിൻ} % പോകുവിൻ, പാടുവിൻ

$imperative-mood-1$ = $verb-suffix-map$ <>:<infl_marker> ^-> ([#Consonants#]+ __ [#POS##BM##Numbers##TMP#]+ <imperative-mood>)
$imperative-mood-ex$ = $special_cases$ <>:<infl_marker> ^-> ( __ [#POS##BM##Numbers##TMP#]+ <imperative-mood>)

$imperative-mood-ex$ || $imperative-mood-1$
