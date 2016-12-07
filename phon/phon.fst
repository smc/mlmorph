#include "../symbols.fst"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Delete analysis only symbols from the surface string
%

ALPHABET = [#Ssym#] [#BM##POS##Numbers##TMP##Lsym#]:<>
$delete-pos$ = .*

$PHON$ =  "<chillu-normalization.a>" \
	|| "<virama-vowel.a>" \
	|| "<virama-consonant.a>" \
	|| "<vowelsign-consonant.a>" \
	|| "<consonant-consonant.a>" \
	|| "<chillu-consonant.a>" \
	|| "<vowelsign-vowel.a>" \
	|| "<word-vowel.a>" \
 	|| $delete-pos$

$PHON$
