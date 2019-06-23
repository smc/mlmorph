SUBDIRS = lexicon phon ninfl vinfl deriv python

include Makefile.inc

.PHONY: all subdirs $(SUBDIRS)

all: malayalam.a python

malayalam.a: morph.a afilter.a
noun.a: ninfl lexicon deriv phon num.a verb.a
verb.a: vinfl lexicon phon
morph.a: verb.a noun.a num.a
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

test: malayalam.a python
	@python3 tests/mlmorph-test.py

coverage-analysis: malayalam.a python
	@python3 tests/coverage-test.py

