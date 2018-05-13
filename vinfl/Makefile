include ../Makefile.inc

SUBDIRS = aspects moods

.PHONY: all subdirs $(SUBDIRS)

all: vinfl.a
vinfl.a: past.a future.a present.a converb-past.a converb.a concessive.a subdirs
converb.a: converb-past.a

subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

