LEXFILES = lexicon/nouns.lex lexicon/adverbs.lex lexicon/conjunctions.lex\
			lexicon/interjections.lex lexicon/demonstrative-prenominal-base.lex \
			lexicon/proper_nouns.lex lexicon/verbs.lex lexicon/misc.lex \
			lexicon/abbreviations.lex
FSTFILES = malayalam.fst symbols.fst num.fst
SOURCES = $(LEXFILES) $(FSTFILES)
SUBDIRS=phon

include Makefile.inc

.PHONY: all  subdirs $(SUBDIRS)

all: malayalam.a dot

malayalam.a: malayalam.fst symbols.fst ninfl.fst deriv.a
deriv.a: subdirs num.a symbols.fst $(LEXFILES)

subdirs:
	for dir in $(SUBDIRS); do  $(MAKE) -C $$dir;  done

dot: malayalam.dot num.dot deriv.dot

testset: ../data/data
	awk '{print $$2}' ../data/data |sort |uniq > tests.all

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt
	-for dir in $(SUBDIRS); do  $(MAKE) -C $$dir clean; done

test:
	fst-mor malayalam.a  < testset.1 |tee /tmp/mlfst-testset1.out|less; \
		(echo -n `date`" "; grep 'no result' </tmp/mlfst-testset1.out|wc -l) >> .testset1-results

# DO NOT DELETE

malayalam.a: malayalam.fst
malayalam.dot: malayalam.a
malayalam.generate.txt: malayalam.a

num.a: num.fst
num.dot: num.a
num.generate.txt: num.a

deriv.a: deriv.fst
deriv.dot: deriv.a
deriv.generate.txt: deriv.a
