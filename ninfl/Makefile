include ../Makefile.inc

SUBDIRS = cases
ninfl.a: plural.a adjective.a cases
.PHONY: all subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

all: ninfl.a

