include ../Makefile.inc

SUBDIRS = aspects moods

.PHONY: all subdirs $(SUBDIRS)

all: tense.a subdirs
tense.a: past.a future.a present.a converb-past.a converb.a concessive.a
concessive.a: past.a
converb.a: converb-past.a

subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

