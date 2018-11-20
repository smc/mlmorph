

SHELL := /bin/bash
DISTNAME=mlmorph-`cat VERSION`
.DEFAULT_GOAL := all
FSTC ?= sfst
ifeq ($(FSTC),hfst)
%.a: %.fst
	hfst-sfstpl2fst -f openfst-tropical -v -i $< -o $@
else
%.a: %.fst
	fst-compiler-utf8 $< $@
endif

%.dot: %.a
	hfst-fst2txt -D -f dot -i $< -o $@

clean:
	@rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt
	@for dir in $(SUBDIRS); do  $(MAKE) -C $$dir clean; done
	@rm -rf build dist