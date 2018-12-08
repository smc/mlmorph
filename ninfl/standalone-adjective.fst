%
% Even though it is undefined in grammar, Malayalam has popular usage of adjective parts as standalone
% words. For example, ചുക്കു കാപ്പി, മലപ്പുറത്തു നിന്നും, സന്തോഷിനു, മാഷു പറഞ്ഞു...
%

#include "../symbols.fst"

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers##compounds#] <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Numbers#

$pseudo-samvruthokaram-to-u$ = {[#Virama#]}:{ു} ^-> ([#Consonants#]+ __ [#inflboundary#]+ <adj> )

"<adjective.a>" || $pseudo-samvruthokaram-to-u$