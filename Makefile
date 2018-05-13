SUBDIRS = lexicon phon ninfl vinfl deriv

include Makefile.inc

.PHONY: all subdirs $(SUBDIRS)

all: malayalam.a

malayalam.a: morph.a afilter.a
noun.a: subdirs
morph.a: noun.a subdirs num.a
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

test: malayalam.a
	python3 tests/mlmorph-test.py
