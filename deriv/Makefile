FSTFILES = noun-from-verb.fst noun-from-noun.fst noun-from-adverb.fst

FSAFILES=$(FSTFILES:.fst=.a)

include ../Makefile.inc

.PHONY: all

all: phon.a
phon.a: $(FSAFILES)

