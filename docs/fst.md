# Finite State Transducer

Mlmorph is based on Finite State Transducer technology. A finite state transducer (FST) maps strings from one regular language (surface language) onto strings from another regular language (analysis language). This process is reversible too. The same transducer can be used to generate (i) analyses for a surface form (in analysis mode) and (ii) surface forms for an analysis (in generation mode). The number of generated or analysed output strings is usually one, but can be more than one while handling morphology variations specific to a language.

## Implementation

The Mlmorph is written in the SFST transducer specification language which is based on extended regular expressions with variables and operators for concatenation, conjunction, disjunction, repetition, composition, negation, context-dependent replacement, and more\cite{schmid2005programming}. A compiler translates the transducer specifications to an optimal automata. The generator automata can be reversed to create the analyser automata using the same compiler. For Mlmorph, the SFST based morphology model is compiled using Helsinki Finite-State Technology(HFST) toolkit \cite{linden2011hfst}. HFST provides programming language interfaces such as python binding, and several tools to work with the compiled automata. SFST is one of the backends HFST supports.

Mlmorph has the following top level composition.

```
$analysis-filter$ || $morph$ || $phon$ || $delete-pos$
```

This composition results in a morphology generator. Reversing the order of composition, we get analyser.

First, the analysis symbols are passed through a filter `$analysis-filter$`. It accepts only the known characters and tags for Mlmorph. It then goes through the morphology rules defined by `$morph$`. The results of morphology generation is applied with the phonological rules defined by `$phon$`. Finally, all POS tags and intermediate tags used internally are removed using `$delete-pos$`. The output is the generated word.

In the transducer `$morph$`, we define what is a word model for Malayalam - `$word$`. We define it is a union of nouns(`$nouns$`), verbs(`$verbs$`), adjectives, adverbs, interjection, quantifiers etc. Kleene's plus(+) and star(*) operators has their usual meaning to denote number of occurrences.

```
$word$ = $punctuations$? ( $nouns$ \
    | $verb$
    | $noun_verb_compounds$ \
    | $adjective$+
    | $adverb$+ \
...
)? $punctuations$*
```

For the sake of brevity, we will explain noun and verb transducer here. A noun is formed by a union of singular nouns or plural nouns. A demonstrative(`$dem$`) or adjective(`$adjective$`) can precede it. The nominal inflectional forms `[#ninfl#]`, postpositions, conjuctions, polarity forms, quantifiers etc. can be suffixes. The whole word then goes through the nominal inflection rules defined by  `$ninfl$` transducer.

```
$suffixes$ = $postpositions$
    | $conjunction$
    | $polarity$
    | $quantifiers$

$noun$ = $dem$
    | ( $dem$? $adjective$? ( $singular_noun$ | $plural_noun$ )

[#ninfl#]? $suffixes$? ) || $ninfl$
```

The verb model is defined as a verb stem from the  defined lexicon going through a composition of union of tense, mood, aspect and adverb forms of verbal inflection.

```
$verb$ = $vstem$
    || ( $verb-tenses$ | $verb-moods$ | $verb-aspects$ | $verb-adverbs$ )
```

The phonological transducer `$phon$` applies the composition of phonological rules on the results of previous steps. The changes are mainly based on the last letter of first joining morpheme and first letter of second morpheme.