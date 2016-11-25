#include "../symbols.fst"

% This leaves boundary markers untouched, useful for obtaining
% surface segmentations.
% ALPHABET = [#C##V##Digit##Ssym#] [#pos##infl_feat#]:<> <RB><MB>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Delete analysis only symbols from the surface string
%

ALPHABET = [#Ssym#] [#BM##POS##Numbers##TMP#]:<>
$delete-pos$ = .*


$PHON$ = "<duplication.a>" \
	|| $delete-pos$

$PHON$
