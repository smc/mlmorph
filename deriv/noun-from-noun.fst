#include "../symbols.fst"

ALPHABET = [#AAsym#]

% വേലക്കാരൻ, വേലക്കരി, വേലക്കാർ, നാട്ടുകാർ, നാട്ടുകാരൻ, പാൽക്കാരൻ,കോൾക്കാർ, കാവൽക്കാരൻ, തോട്ടക്കാരൻ..
% കടക്കാരൻ, വീട്ടുകാരൻ..

% Verbal nouns that are unmarked for tense are formed through the addition of one
% of a range of suffixes, and they vary to the extent to which they are productive.

#=D# = #Consonants##Chillus#

$noun-forms$ = {്}: {ുകാരൻ} | {്}: {ുകാരി} | {്}: {ുകാർ}  |\
	{ി} : {ിയൻ} |  {ി} : {ിയത്തി} |  {ി} : {ിയർ}  |\
	{ം} : {ക്കാരൻ} | {ം} : {ക്കാരി} |  {ം} : {ക്കാർ} |\
	{[#=D#]}:{[#=D#]ക്കാരൻ} | {[#=D#]}:{[#=D#]ക്കാരി} | {[#=D#]}:{[#=D#]ക്കാർ}

$nouns$ = $noun-forms$ ^-> ([#Letters#]+ __ [#POS##BM##Numbers##TMP#]+ <n><deriv>)

$nouns$