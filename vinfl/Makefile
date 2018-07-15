include ../Makefile.inc

SUBDIRS = aspects moods voices adverbs

.PHONY: all subdirs $(SUBDIRS)

all: tense.a subdirs
tense.a: past.a future.a present.a concessive.a
concessive.a: past.a

subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@
