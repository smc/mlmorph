%
% FSTs for nominal inflections
%

#include "symbols.fst"

%%%%%%%%%%%% Noun Inflections %%%%%%%%%%%%%%

%%%%% plural

$plural$ = <pl>:{കൾ}

% sambodhana - മരമേ, കാടേ, പൂച്ചേ, അവരേ, അവളേ, മലരേ, പട്ടികളേ, പട്ടീ
$vocative$ = {<vocative>}:{ഏ}

% കടലിനെ, ആനയെ, പൂച്ചയെ, ആടിനെ, മരത്തെ
$accusative$ = {<accusative>}:{എ} \
	| {<accusative>}:{ഇനെ}

% ആനയുടെ, കടലിന്റെ, പേരിന്റെ, പൂച്ചയുടെ, മുറ്റത്തിന്റെ
$genitive$ = {<genitive>}:{യുടെ} \
	| {<genitive>}:{ഇന്റെ}

% മഴയ്ക്ക്,  ഇലയ്ക്ക്, കാടിന്, വീടിന്
$dative$ = {<dative>}:{യ്ക്ക്} \
	| {<dative>}: {ക്ക്} \
	| {<dative>}: {ക്കു്} \
	| {<dative>}: {യ്ക്കു്} \
	| {<dative>}: {ഇന്}

% ആനയാൽ, വടിയാൽ, വടികൊണ്ട്
$instrumental$ = {<instrumental>}:{ആൽ} \
	| {<instrumental>}: {കൊണ്ട്} \
	| {<instrumental>}: {കൊണ്ടു്}

% പുഴയിൽ, പാലത്തിൽ
$locative$ = {<locative>}:{ഇൽ}

$sociative$ = {<sociative>}:{ഓട്} \
	| {<sociative>}:{ഓടു്}

$NINFL$ = ($plural$ | $vocative$ | $accusative$ \
	| $genitive$ | $dative$ | $instrumental$ \
	| $locative$ | $sociative$ ) <MB>
