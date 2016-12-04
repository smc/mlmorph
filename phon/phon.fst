#include "../symbols.fst"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Delete analysis only symbols from the surface string
%

ALPHABET = [#Ssym#] [#BM##POS##Numbers##TMP#]:<>
$delete-pos$ = .*

$PHON$ =  "<chillu-normalization.a>"? \
	|| "<virama-vowel.a>" \
	|| "<virama-consonant.a>" \
	|| "<vowelsign-consonant.a>" \
	|| "<vowelsign-vowel.a>" \
	|| "<word-vowel.a>" \
 	|| $delete-pos$

$PHON$
