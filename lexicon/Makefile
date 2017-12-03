LEXFILES = nouns.fst proper-nouns.fst pronouns.fst prepositions.fst \
	adjectives.fst demonstratives.fst adverbs.fst interjections.fst \
	conjunctions.fst verbs.fst misc.fst abbreviations.fst questions.fst \
	indeclinables.fst borrowed-words.fst polarity.fst quantifiers.fst
LEXFSAFILES=$(LEXFILES:.fst=.a)

include ../Makefile.inc

.PHONY: all

all: $(LEXFSAFILES)
nouns.fst: nouns.lex
proper-nouns.fst: proper-nouns.lex person-names.lex software-names.lex times.lex places.lex languages.lex
conjunctions.fst: conjunctions.lex
abbreviations.fst: abbreviations.lex
pronouns.fst: pronouns.lex
adjectives.fst: adjectives.lex
verbs.fst: verbs.lex
interjections.fst: interjections.lex
demonstratives.fst: demonstratives.lex
questions.fst: questions.lex
borrowed-words.fst: english-borrowed.lex
prepositions.fst: prepositions.lex
polarity.fst: affirmatives.lex negations.lex
quantifiers.fst: quantifiers.lex
clean:
	-rm -f *.a *~ Makefile.bak
