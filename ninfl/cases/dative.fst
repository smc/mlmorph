%
% FSTs for nominal dative(ഉദ്ദേശിക) inflections
%

#include "../../symbols.fst"

%%%%%%%%%%%% Noun Inflections - Dative  %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers#] <dative> <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Lsym##Numbers#

$dative-del$ = {[#Anuswara#ൻർ]}:{} ^-> (__ [#inflboundary# ]+ <del> )

% Dative inflection rules മഴയ്ക്ക്, ഇലയ്ക്ക്, കാടിന്, വീടിന്
$dative-cons-vowel-forms$ = {<dative>}:{യ്ക്ക്<infl_marker>} | {<dative>}:{യ്ക്കു്<infl_marker>} | {<dative>}:{യ്ക്കു<infl_marker>} | \
	{<dative>}:{ക്<infl_marker>}

$dative-cons-vowel$ = $dative-cons-vowel-forms$ ^-> ([#Consonants##VowelSigns#] [#inflboundary# ]+ __)

$dative-virama-forms$ = {<dative>}: {ഇന്<infl_marker>} |\
	{<dative>}: {ഇനു്<infl_marker>} |\
	{<dative>}: {ഇനു<infl_marker>}
$dative-virama$ = $dative-virama-forms$ ^-> ([#Virama#ൽൺ] [#inflboundary# ]+ __)

$dative-chillu-form-n-forms$ = {<dative>}: {<del>ന്<infl_marker>} | {<dative>}: {<del>നു്<infl_marker>} | {<dative>}: {<del>നു<infl_marker>}
$dative-chillu-form-n$ = $dative-chillu-form-n-forms$ ^-> ([ൻ] [#inflboundary# ]+ __)
$dative-chillu-form-r-forms$ = {<dative>}: {<del>[രറ]ിന്<infl_marker>} | {<dative>}: {<del>[രറ]ിനു്<infl_marker>} |\
	{<dative>}: {<del>[രറ]ിനു<infl_marker>}
$dative-chillu-form-r$ = $dative-chillu-form-r-forms$ ^-> ([ർ] [#inflboundary# ]+ __)
$dative-chillu-form-l-k-forms$ = {<dative>}:{ക്<infl_marker>}| {<dative>}:{കു്<infl_marker>} | {<dative>}:{കു<infl_marker>}
$dative-chillu-form-l-k$ = $dative-chillu-form-l-k-forms$ ^-> ([ൾർ] [#inflboundary# ]+ __)
$dative-chillu-form$ = $dative-chillu-form-n$ | $dative-chillu-form-r$ |\
	$dative-chillu-form-l-k$
$dative-chillu$ = $dative-chillu-form$ || $dative-del$

$dative-anuswara-forms$ = {<dative>}: {<del>ത്തിന്<infl_marker>} |\
	{<dative>}: {<del>ത്തിനു്<infl_marker>} |\
	{<dative>}: {<del>ത്തിനു<infl_marker>}
$dative-anuswara$ = $dative-anuswara-forms$ ^-> ([#Anuswara#] [#inflboundary# ]+ __)

$dative-anuswara$ = $dative-anuswara$ || $dative-del$

$dative-special-cases$ = {ഞാൻ}:{എനിക്ക്<infl_marker>} | {ഞാൻ}:{എനിക്കു്<infl_marker>} | {ഞാൻ}:{എനിക്കു<infl_marker>} |\
	{ഞാൻ}:{എനിയ്ക്ക്<infl_marker>} | \
	{താൻ}:{തനിക്ക്<infl_marker>} | {താൻ}:{തനിക്കു്<infl_marker>} | {താൻ}:{തനിക്കു<infl_marker>} |\
	{താൻ}:{തനിയ്ക്ക്<infl_marker>} |{താൻ}:{തനിയ്ക്കു<infl_marker>} | \
	{നാം}:{നമുക്ക്<infl_marker>} | {നാം}:{നമുക്കു്<infl_marker>} | {നാം}:{നമുക്കു<infl_marker>} | \
	{അവർ}:{അവർക്ക്<infl_marker>} | {അവർ}:{അവർക്കു്<infl_marker>} | {അവർ}:{അവർക്കു<infl_marker>} |\
	{നീ}: {നിനക്ക്<infl_marker>} | {നീ}: {നിനക്കു്<infl_marker>} | {നീ}: {നിനക്കു<infl_marker>}
$remove-dative-ninfl$ = {<dative>}:{} ^-> (<infl_marker> [#inflboundary#]+ __ )
$dative-exceptions$ = $dative-special-cases$ ^-> (__ [#inflboundary#]+ <dative> )
$dative-exceptions$ = $dative-exceptions$ ||$remove-dative-ninfl$

$dative$ = $dative-exceptions$ || $dative-cons-vowel$ || $dative-virama$ || $dative-chillu$ || $dative-anuswara$

$dative$
