#include "symbols.fst"

% Numbers represented in text format has limited vocabulary because of obvious reason
% The lexicon for that is given below.
$half$ = അര <half>
$n20-80-compound$ = തി
$n90-compound$ = റി
$n11-19$ = (പതി <tens> നൊന്ന്|പന്ത്ര <tens> ണ്ട്|പതി <tens> മൂന്ന്|പതി <tens> നാല്|പതി <tens> നഞ്ച്|പതി <tens> നാറ്|പതി <tens> നേഴ്|പതി <tens> നെട്ട്|പത്തൊ <tens> മ്പത്)
$n0$ = പൂജ്യം
$n2-9$ = (രണ്ട്|മൂന്ന്|നാല്|അഞ്ച്|ആറ്|ഏഴ്|എട്ട്|ഒമ്പത്)
$n1$ = ഒന്ന്
$n1-adj$ = ഒരു
$n10$ = പത്ത്
$n20-80$ = (ഇരുപത്|മുപ്പത്|നാല്പത്|അമ്പത്|അറുപത്|എഴുപത്|എൺപത്)
$n90$ = തൊണ്ണൂറ്
$n100-800$ = (നൂറ് | ഇരുനൂറ് | മുന്നൂറ് | നാനൂറ് | അഞ്ഞൂറ് | അറുനൂറ് | എഴുന്നൂറ് | എണ്ണൂറ് )
$n100-800-compound$ = റി
$n900$ = തൊള്ളായിരം
$n900-prefix$ = തൊള്ളായിരത്തി
$n1k$ = ആയിരം
$n1k-prefix$ = ആയിരത്തി
$n1l$ = ലക്ഷം <lakhs>
$n1c$ = കോടി <crores>

% ones
$N1$ =	( $n1$ | $n2-9$ ) <ones>

% tens
$N10$ = ( \
	( $n10$ | $n20-80$ | $n90$) <tens> ) |\ 	% പത്ത്, ഇരുപത്..എൺപത്, തൊണ്ണൂറ്
	( \
		( $n11-19$ <ones> ) |\					% പതിനൊന്ന്, പന്ത്രണ്ട്...പത്തൊമ്പത്
		( \
			( $n20-80$ $n20-80-compound$ ) |\	% ഇരുപത് + തി
			( $n90$ $n90-compound$ ) \			% തൊണ്ണൂറ്	+ റി
		) <tens> $N1$ \							% ഒന്ന്..രണ്ട്..ഒമ്പത്.
	)

% hundreds
$N100$ = ( \
	( \
		$n100-800$|$n900$ \						% നൂറ്,... എണ്ണൂറ്, തൊള്ളായിരം
	) <hundreds> \
	) |\
	( \
		( \
			( $n100-800$ $n100-800-compound$ ) |\ % നൂറ് + റി, ഇരുന്നൂറ് + റി
			( $n900-prefix$ ) \					% തൊള്ളായിരത്തി
		) <hundreds> $N10$ \					% ഒന്ന്.. തൊണ്ണൂറ്റൊമ്പത്
	)

% thousands
$N1K$ = ( $N10$ )? ( ( $n1k$ <thousands> ) | ( $n1k-prefix$ <thousands> $N100$ ) )
$N1L$ = ( $N1$|$N10$|$N100$ )? $n1l$ ($N1K$|$N100$|$N10$|$N1$)?
$N1C$ = ( $N1$|$N10$|$N100$ )? $n1c$ ($N1L$|$N1K$|$N100$|$N10$|$N1$)?

$numbers$ = ($n0$ | $N1$ |	$N10$ | $N100$ | $N1K$ ) $half$?

ALPHABET = [#Asym#] [#Numbers#]

% Delete the viram sign if it is at the end of any of <ones><tens><hundreds><thousands>
% and followed by a vowel. Eg: ആറ് + ആയിരം = ആറായിരം. The ആ will be deleted in
% following steps.
$delete-virama$ = {[#Virama#]}:{<>} ^-> ( __ [<ones><tens><hundreds><thousands>] [#Vowels#] )

% Delete അ vowel which occur anywhere in the text, except at first fragment.
% Eg: ആറായിരത്തിഅഞ്ച് -> ആറായിരത്തിഞ്ച്. ി sign get deleted in following steps
$delete-a$ = {അ}:{<>} ^-> ( [<ones><tens><hundreds><thousands>] __ )

% Delete ി sign which occur just before any of <ones><tens><hundreds><thousands> and
% followed by a Vowel
% Eg: ആറായിരത്തിഅഞ്ച് -> ആറായിരത്തിഞ്ച്. അ get deleted in other steps.
$delete-i-from-tens$ = {ി} :{<>} ^-> ( __ [<ones><tens><hundreds><thousands>] [#Vowels#] )

% Delete Vowels and replace it by its vowel sign when the vowel is after any of
% <ones><tens><hundreds><thousands>. Eg: ആറായിരത്തിഏഴ് -> ആറായിരത്തേഴ്. ി sign
% get deleted in other steps.
$replace-vowel-by-sign-a$ = {ആ}: {ാ} ^-> ( [<ones><tens><hundreds><thousands>] __ )
$replace-vowel-by-sign-e$ = {എ}: {െ} ^-> ( [<ones><tens><hundreds><thousands>] __ )
$replace-vowel-by-sign-E$ = {ഏ}: {േ} ^-> ( [<ones><tens><hundreds><thousands>] __ )
$replace-vowel-by-sign-o$ = {ഒ}: {ൊ} ^-> ( [<ones><tens><hundreds><thousands>] __ )
$replace-vowel-by-sign$ = $replace-vowel-by-sign-a$ ||\
	$replace-vowel-by-sign-e$ ||\
	$replace-vowel-by-sign-E$ ||\
	$replace-vowel-by-sign-o$

$join-num-parts$ = $delete-virama$ || $delete-a$ || $delete-i-from-tens$ || $replace-vowel-by-sign$

$numbers$ || $join-num-parts$  

% ($n0$ | $N1$ | $N10$ | $N100$ | $N1K$ | $N1M$ | $N1G$ ) | $Num$
