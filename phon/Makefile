FSTFILES = duplication.fst
FSAFILES=$(FSTFILES:.fst=.a)

include ../Makefile.inc

.PHONY: all

all: phon.a

phon.a: $(FSAFILES) phon.fst ../symbols.fst

clean:
	-rm -f *.a *~ Makefile.bak

# DO NOT DELETE
duplication.a: ../symbols.fst
phon.a: ../symbols.fst
