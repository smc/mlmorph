#include "../symbols.fst"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Delete analysis only symbols from the surface string

ALPHABET = [#Ssym#] [#BM##POS##Numbers##TMP##Lsym#]:<>
$delete-pos$ = .*

$PHON$ =  "<chillu-normalization.a>" \
	|| "<vowelsign-consonant.a>" \
	|| "<consonant-consonant.a>" \
	|| "<chillu-consonant.a>" \
	|| "<consonant-vowel.a>" \
	|| "<vowelsign-vowel.a>" \
	|| "<virama-vowel.a>" \
	|| "<virama-consonant.a>" \
	% Replace all vowels with its signs appearing anywhere in string except at beginning
	|| "<vowel-to-vowelsign.a>" \
	% Delete all analysis strings
 	|| $delete-pos$

$PHON$
