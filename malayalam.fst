% malayalam.fst
%
% Actual morphotactics is described in this file.
%
%

#include "symbols.fst"

$noun-reg-infl$ = <Noun>:<> (\
    {<sg>}:{} |\
    {<pl>}:{കൾ} |\
    {<nominative>}:{} |\
    {<vocative>}:{െ} |\
    {<accusative>}:{യെ} |\
    {<genitive>}:{യുടെ} |\
    {<dative>}:{യ്ക്ക്} |\
    {<instrumental>}:{യാൽ} |\
    {<locative>}:{യിൽ} |\
    {<sociative>}:{യോടു} )

$noun-infl$ = "lexicon/nouns.lex" $noun-reg-infl$
$numbers$ = "<num.a>"
$WORD$ = $noun-infl$ |\
    $numbers$
$WORD$
