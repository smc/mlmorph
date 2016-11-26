FSTFILES = duplication.fst deletion.fst substitution.fst chillu-normalization.fst
FSAFILES=$(FSTFILES:.fst=.a)

include ../Makefile.inc

.PHONY: all

all: phon.a

phon.a: $(FSAFILES) phon.fst ../symbols.fst

clean:
	-rm -f *.a *~ Makefile.bak

# DO NOT DELETE
chillu-normalization.a: ../symbols.fst
duplication.a: ../symbols.fst
deletion.a: ../symbols.fst
substitution.a: ../symbols.fst
phon.a: ../symbols.fst
