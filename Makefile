LEXFILES = lexicon/nouns.lex lexicon/adverbs.lex lexicon/conjunctions.lex\
			lexicon/interjections.lex lexicon/demonstrative-prenominal-base.lex \
			lexicon/proper_nouns.lex lexicon/verbs.lex lexicon/misc.lex \
			lexicon/abbreviations.lex
FSTFILES = malayalam.fst symbols.fst num.fst
SOURCES = $(LEXFILES) $(FSTFILES)
SUBDIRS=phon

include Makefile.inc

.PHONY: all  subdirs $(SUBDIRS)

all: malayalam.a

malayalam.a: malayalam.fst symbols.fst ninfl.fst deriv.a
deriv.a: subdirs num.a symbols.fst $(LEXFILES)

subdirs:
	for dir in $(SUBDIRS); do  $(MAKE) -C $$dir;  done

dot: malayalam.dot num.dot deriv.dot

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt
	-for dir in $(SUBDIRS); do  $(MAKE) -C $$dir clean; done

test: malayalam.a
	python3 python/mlmorph-test.py

# DO NOT DELETE

malayalam.a: malayalam.fst
malayalam.dot: malayalam.a

num.a: num.fst
num.dot: num.a

deriv.a: deriv.fst
deriv.dot: deriv.a
