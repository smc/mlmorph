%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "../symbols.fst"

ALPHABET = [#AAsym#] [#POS##BM##Numbers#]

% Virama get deleted if followed by a vowel
% ആട് + അല്ല => ആടല്ല
% പൂവ് + അമ്പലം => പൂവമ്പലം


$del-virama$ = {[#Virama#]}:{<>} ^-> (__ [#POS##BM##Numbers#] [#Vowels#] )

$tests$ = പൂവ് <Noun> അമ്പലം <Noun>

$Del$ = $del-virama$

% Uncomment below line for testing
% $tests$ ||\
$Del$ || .*
