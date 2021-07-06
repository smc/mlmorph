# Lexicon

Lexicon is one of the core part of Morphology analyser. It is a database of all known non-inflected word forms in the language. It has nouns, verbs, adjectives, adverbs, conjunctions and so on.

In mlmorph, they are arranges in `.lex` files in lexicon folder. They are plain text files with one word per line. They are alphabetically sorted too. The lexicon is plit into many files based on its category. For example, nouns will appear in `nouns.lex`, verbs will appear in `verbs.lex`. Subtypes of nouns - for example, nouns that follow Sanskrit inflectional characteristics are placed in `nouns-sanskrit.lex` and so on.

The words we have in lexicon undergoes morphological and phonological transformation to generate Malayalam words.  So, having "ആന" in `nouns.lex` is required to generate ആനകൾ, ആനയുടെ. Similarly to analyse a word like ആനയുടെ, it is important to have ആന in our lexicon.

## Completeness

When we say *all known words*, that does not mean our lexicon is 100% complete. It will never complete. The idea is to collect as much as possible items and add to lexicon.

## Collection strategy

Instead of manually adding each and every word, we try to add large number of words that we source from various places. For example, place names were sourced from Malayalam wikipedia by filtering by category. Names were collected from public SSLC results published by Kerala education department. Verbs were collected from Malayalam wiktionary.

The secondary way of adding words is by running mlmorph against random text corpus. We will do a frequency analysis of most missed words. Then those words will be added to respective lexicon files.

## Curation

When we use various sources for our lexicon, it is required to make sure they don't have spelling mistakes. Spelling fixes are tedious manual work, but some patterns can be fixed by doing a find-replace. In addition to this, the content we source usually has encoding issue that we need to normalize. Mlmorph has a normalization script to do this.
