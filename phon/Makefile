FSTFILES = chillu-normalization.fst virama-vowel.fst \
 	virama-consonant.fst vowel-to-vowelsign.fst consonant-vowel.fst \
	vowelsign-consonant.fst consonant-consonant.fst \
	chillu-consonant.fst \
	vowelsign-vowel.fst
FSAFILES=$(FSTFILES:.fst=.a)

include ../Makefile.inc

.PHONY: all

all: phon.a

phon.a: $(FSAFILES) phon.fst ../symbols.fst

clean:
	-rm -f *.a *~ Makefile.bak

# DO NOT DELETE
chillu-normalization.a: ../symbols.fst
phon.a: ../symbols.fst
