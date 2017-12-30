#include "../symbols.fst"

ALPHABET = [#AAsym#]

% വേലക്കാരൻ, വേലക്കരി, വേലക്കാർ, നാട്ടുകാർ, നാട്ടുകാരൻ, പാൽക്കാരൻ,കോൾക്കാർ, കാവൽക്കാരൻ, തോട്ടക്കാരൻ..
% കടക്കാരൻ, വീട്ടുകാരൻ..

% Verbal nouns that are unmarked for tense are formed through the addition of one
% of a range of suffixes, and they vary to the extent to which they are productive.

#=D# = #Consonants##Chillus#

$noun-forms-masculine$ = {്}: {ുകാരൻ} | {ി} : {ിയൻ} | {ം} : {ക്കാരൻ} | {[#=D#]}:{[#=D#]ക്കാരൻ}

$noun-forms-feminine$ = {്}: {ുകാരി} | {ി} : {ിയത്തി} | {ം} : {ക്കാരി} | {[#=D#]}:{[#=D#]ക്കാരി}

$noun-forms-neutral$ = {്}: {ുകാർ} | {ി} : {ിയർ} | {ം} : {ക്കാർ} | {[#=D#]}:{[#=D#]ക്കാർ}

$nouns-masculine$ = $noun-forms-masculine$ ^-> ([#Letters#]+ __ [#POS##BM##TMP#]+ <masculine> <n> <deriv>)
$nouns-feminine$ = $noun-forms-feminine$ ^-> ([#Letters#]+ __ [#POS##BM##TMP#]+ <feminine> <n> <deriv>)
$nouns-neutral$ = $noun-forms-neutral$ ^-> ([#Letters#]+ __ [#POS##BM##TMP#]+ <neutral> <n> <deriv>)

$nouns$ = $nouns-masculine$ || $nouns-feminine$ || $nouns-neutral$
$nouns$