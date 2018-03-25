include ../Makefile.inc

vinfl.a: past.a future.a present.a converb.a concessive.a

.PHONY: all

all: vinfl.a
past.a: past-forms.fst
converb.a: past-forms.fst
clean:
	-rm -f *.a *~ Makefile.bak
