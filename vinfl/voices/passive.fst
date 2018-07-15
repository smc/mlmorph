#include "../../symbols.fst"

% ഉദാഹരണം: കൊല്ലപ്പെടുക, എഴുതപ്പെടുക

ALPHABET = [#Letters##POS##TMP##infl#] [#BM#]:<>

%%%% കർമ്മണിപ്രയോഗങ്ങൾ %%%%%%%%%

$verb-suffix-map$ = {ുക}:{പ്പെടുക}
$passive-voice$ = $verb-suffix-map$  ^-> ([#Consonants#]+ __  [<v>#BM##TMP#]+ <passive-voice> )

$tests$ = പതറുക<v><RB><passive-voice>
$tests$ || $passive-voice$  >> "passive.test.a"

$passive-voice$ || .*
