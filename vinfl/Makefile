include ../Makefile.inc

vinfl.a: past.a future.a present.a converb-past.a converb.a concessive.a

.PHONY: all

all: vinfl.a
past.a: past-forms.fst
converb.a: past-forms.fst converb-past.a
clean:
	-rm -f *.a *~ Makefile.bak
