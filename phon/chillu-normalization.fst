%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#]

% Convert atomic chillus to cons+ virama form if followed by Vowel

$chillu-normalization$ = {ൿ}: {ക്} | {ൽ}: {ല്} | {ൾ}: {ള്} | {ർ}: {ര്} | {ർ}: {റ്} |{ൻ}: {ന്} | {ൺ}: {ണ്} |  {ം}:{മ്}
$replace-chillus$ = $chillu-normalization$ ^-> ( __ [#POS##BM##Numbers##TMP##compounds##Lsym#]+ [#Vowels##VowelSigns#] )

$ChilluNorm$ = $replace-chillus$

% Uncomment below line for testing
%$tests$ = <>:<BoW>നിറം<np><>:<RB><>:<EoW><>:<BoW>അല്ല<cnj><>:<RB><>:<EoW>
%$tests$ || $ChilluNorm$ >> "chillu-normalization-test.a"

$ChilluNorm$
