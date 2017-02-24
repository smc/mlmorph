SUBDIRS = lexicon phon

include Makefile.inc

.PHONY: all subdirs $(SUBDIRS)

all: malayalam.a

malayalam.a: morph.a afilter.a phon/phon.a
morph.a: subdirs ninfl.a num.a
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

clean:
	-rm -f *.a *.dot *~ Makefile.bak tests.all *.gen*.txt
	-for dir in $(SUBDIRS); do  $(MAKE) -C $$dir clean; done

test: malayalam.a
	python3 python/mlmorph-test.py
