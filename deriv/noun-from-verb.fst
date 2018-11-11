%% Verbal Nouns %%%%

#include "../symbols.fst"

ALPHABET = [#AAsym#]

% ഉദാഹരണം: ഓടൽ, കരയൽ, മറിയൽ, പുകയൽ, ഉറങ്ങൽ, പിടച്ചിൽ

% Verbal nouns that are unmarked for tense are formed through the addition of one
% of a range of suffixes, and they vary to the extent to which they are productive.

$noun-forms$ = {രുക}: {രൽ} |\
	{റുക} : {റൽ} |\
	{ൽകുക} : {ൽകൽ} |\
	{ാകുക} : {ാകൽ} |\
	{യുക} : {യൽ} |\
	{യുക} : {ച്ചിൽ} |\
	{യ്ക്കുക} : {യ്ക്കൽ} |\
	{ക്കുക} : {ക്കൽ} |\
	{ടുക} : {ടൽ} |\
	{ങ്ങുക} : {ങ്ങൽ} |\
	{തുക} : {തൽ} |\
	{വുക} : {വൽ} |\
	{ഴുക} : {ഴൽ} |\
	{രുക}: {ർച്ച} |\
	{റുക} : {റ്റം} |\
	{ോകുക} : {ോക്ക്} |\
	{യുക} : {വ്} |\
	{യ്ക്കുക} : {യ്പ്പ്} |\
	{യ്ക്കുക} : {പ്പ്} |\
	{ക്കുക} : {ത്തം} |\
	{ടുക} : {ട്ടം} |\
	{ങ്ങുക} : {ക്കം} |\
	{തുക} : {ത്ത്} | {തുക} : {ത്തു്} |\
	{ഴുക} : {ഴ്ച}

$nouns$ = $noun-forms$ ^-> ([#Letters#]+ __ [#POS##BM##TMP##vinfl#]+ <n> <deriv> )

% Incomplete.
% Refer: കേരളപാണിനീയം - കൃതികൃത്തുക്കൾ. 20 പ്രത്യയങ്ങൾ
% May be we need tagging for verbs as കേവലക്രിയ, പ്രയോജകക്രിയ to aid this processing of 20 different forms.

$nouns$
