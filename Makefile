LEXFILES = lexicon/nouns.lex
FSTFILES = malayalam.fst symbols.fst num.fst
SOURCES = $(LEXFILES) $(FSTFILES)

include Makefile.inc

.PHONY: all

all: clean malayalam.a

malayalam.a: malayalam.fst symbols.fst deriv.a
deriv.a: num.a symbols.fst $(LEXFILES)

archive:
	./archive.sh $(DISTNAME)

view: malayalam.a
	fst-print malayalam.a > malayalam.txt
	foma -f tools/visualize.script
testset: ../data/data
	awk '{print $$2}' ../data/data |sort |uniq > tests.all

clean:
	-rm -f *.a *~ Makefile.bak tests.all
	-for dir in $(SUBDIRS); do  $(MAKE) -C $$dir clean; done

#Makefile: *.fst
#	-makedepend -Y -o.a $(SOURCES) 2>/dev/null

test:
	fst-mor malayalam.a  < testset.1 |tee /tmp/mlfst-testset1.out|less; \
		(echo -n `date`" "; grep 'no result' </tmp/mlfst-testset1.out|wc -l) >> .testset1-results

# DO NOT DELETE

malayalam.a: malayalam.fst
num.a: symbols.fst
