#include "symbols.fst"

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

$N1$ =  ( $n1$ | $n2-9$ ) <ones> $half$?
$N10$ = ( ( $n10$ | $n20-80$ | $n90$) <tens> $half$? ) |\
 ( \
  ( $n11-19$ <ones> $half$?) |\
  ( ( $n20-80$ $n20-80-compound$ ) | ( $n90$ $n90-compound$ ) ) <tens> $N1$ \
 )
$N100$ = ( ( $n100-800$|$n900$ ) <hundreds> $half$? ) |\
 ( ( ( $n100-800$ $n100-800-compound$ ) | ( $n900-prefix$ ) ) <hundreds> $N10$ )
$N1K$ = ( $N10$ )? ( ( $n1k$ <thousands> ) | ( $n1k-prefix$ <thousands> $N100$ ) )
$N1L$ = ( $N1$|$N10$|$N100$ )? $n1l$ ($N1K$|$N100$|$N10$|$N1$)?
$N1C$ = ( $N1$|$N10$|$N100$ )? $n1c$ ($N1L$|$N1K$|$N100$|$N10$|$N1$)?

ALPHABET = [#Asym#] [#numbers#]
$delete-virama$ = {[#Virama#]}:{<>} ^-> ( __ [<ones><tens><hundreds><thousands>] [#Vowels#] )
$delete-a$ = {അ}:{<>} ^-> ( [<ones><tens><hundreds><thousands>] __ )
$delete-i-from-tens$ = {ി} :{<>} ^-> (__ [<ones><tens><hundreds><thousands>] [#Vowels#])
$replace-vowel-by-sign-a$ = {ആ}: {ാ} ^-> ( [<ones><tens><hundreds><thousands>] __)
$replace-vowel-by-sign-e$ = {എ}: {െ} ^-> ( [<ones><tens><hundreds><thousands>] __)
$replace-vowel-by-sign-E$ = {ഏ}: {േ} ^-> ( [<ones><tens><hundreds><thousands>] __)
$replace-vowel-by-sign-o$ = {ഒ}: {ൊ} ^-> ( [<ones><tens><hundreds><thousands>] __)
$replace-vowel-by-sign$ = $replace-vowel-by-sign-a$ ||\
 $replace-vowel-by-sign-e$ ||\
 $replace-vowel-by-sign-E$ ||\
 $replace-vowel-by-sign-o$

% delete pos tags
ALPHABET = [#Asym#] [#numbers#]:<>
$delete-pos$ = .*

$join-num-parts$ = $delete-virama$ || $delete-a$ || $delete-i-from-tens$ || $replace-vowel-by-sign$

% TODO: this is too liberal
$Num$ = [#Perc#]? [#Digit#] [#Digit##Nsep#]*

($n0$ | $N1$ |  $N10$ | $N100$ | $N1K$ ) ||\
  $join-num-parts$ || $delete-pos$
% ($n0$ | $N1$ | $N10$ | $N100$ | $N1K$ | $N1M$ | $N1G$ ) | $Num$
