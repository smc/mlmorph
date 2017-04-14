%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Convert atomic chillus to cons+ virama form if followed by Vowel

$chillu-normalization$ = {ൿ}: {ക്} | {ൽ}: {ല്} | {ൾ}: {ള്} | {ർ}: {ര്} |{ൻ}: {ന്} | {ൺ}: {ണ്} | {ം}:{മ്}
$replace-chillus$ = $chillu-normalization$ ^-> ( __ [#POS##BM##Numbers##TMP#]+ [<del>#Vowels#] )

$ChilluNorm$ = $replace-chillus$

% Uncomment below line for testing
% $tests$ = അവൻ <Noun> അല്ല <Noun>
%$tests$ ||\
$ChilluNorm$ || .*
