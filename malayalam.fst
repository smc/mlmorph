% malayalam.fst
%

#include "symbols.fst"

ALPHABET = [#Ssym#] [#BM##POS##Numbers##TMP##Lsym##compounds#]:<>

%%% Delete analysis only symbols from the surface string
$delete-pos$ = .*

$afilter$ = "<afilter.a>"
$morph$ = "<morph.a>"
$phon$ = "<phon/phon.a>"

$afilter$ || <BoW> $morph$ <EoW> || $phon$ || $delete-pos$
