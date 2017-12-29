FSTFILES = noun-from-verb.fst

FSAFILES=$(FSTFILES:.fst=.a)

include ../Makefile.inc

.PHONY: all

all: phon.a
phon.a: $(FSAFILES)
clean:
	-rm -f *.a *~ Makefile.bak
