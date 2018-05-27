SUBDIRS = lexicon phon ninfl vinfl deriv

include Makefile.inc

.PHONY: all subdirs $(SUBDIRS)

all: malayalam.a

malayalam.a: morph.a afilter.a
noun.a: ninfl lexicon deriv phon
verb.a: vinfl lexicon phon
morph.a: noun.a verb.a num.a
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

test: malayalam.a
	python3 tests/mlmorph-test.py
