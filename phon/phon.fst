#include "../symbols.fst"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

$PHON$ = "<exceptions.a>" \
	|| "<verb-negation.a>" \
	|| "<chillu-normalization.a>" \
	|| "<vowelsign-consonant.a>" \
	|| "<consonant-consonant.a>" \
	|| "<chillu-consonant.a>" \
	|| "<consonant-vowel.a>" \
	|| "<vowelsign-vowel.a>" \
	|| "<virama-vowel.a>" \
	|| "<virama-consonant.a>" \
	|| "<vowel-to-vowelsign.a>" % Replace all vowels with its signs appearing anywhere in string except at beginning

$test$ = <>:<BoW>മാല<n><RB><accusative>:യ<>:എ<del><LB>ഒ<indeclinable><RB><>:<EoW> |\
	<>:<BoW>മോർ<n><RB><locative>:ഇ<>:ൽ<del><LB>എ<indeclinable><RB><>:<EoW> |\
	<>:<BoW>മോർ<n><RB><locative>:ഇ<>:ൽ<del><LB>കൂടി<cnj><RB><>:<EoW> | \
	<>:<BoW>ആതി<n><RB><LB>ഇരിക്കുക<v><RB><>:<EoW> | \
	<>:<BoW>ആതി<n><n-v-compound><RB><LB>ഇരിക്കുക<v><RB><>:<EoW> | \
	<>:<BoW>ആശാ<n><RB><>:<EoW> |\
	<>:<BoW>ആശാ<sanskrit><RB><>:<EoW> |\
	<>:<BoW>നത<n><RB><adj>അംഗി<sanskrit><RB><adj><>:<EoW>  |\
	<>:<BoW>നത<sanskrit><RB><adj>അംഗി<sanskrit><RB><adj><>:<EoW>

$test$ || $PHON$ >> "phon.test.a"

$PHON$
