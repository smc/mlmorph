#include "../symbols.fst"

% This leaves boundary markers untouched, useful for obtaining
% surface segmentations.
% ALPHABET = [#C##V##Digit##Ssym#] [#pos##infl_feat#]:<> <RB><MB>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Delete analysis only symbols from the surface string
%

% ALPHABET = [#Ssym#] [#BM##POS#]:<>
ALPHABET = [#AAsym#] [#BM##POS##TMP#]:<>
$delete-pos$ = .*


$PHON$ = $delete-pos$

$PHON$
