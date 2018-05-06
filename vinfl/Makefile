include ../Makefile.inc

SUBDIRS = aspects moods

vinfl.a: past.a future.a present.a converb-past.a converb.a concessive.a subdirs

.PHONY: all subdirs $(SUBDIRS)

all: vinfl.a
past.a: past-forms.fst
converb.a: past-forms.fst converb-past.a

subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

