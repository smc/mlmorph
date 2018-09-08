include ../Makefile.inc

SUBDIRS = cases
ninfl.a: plural.a adjective.a standalone-adjective.a cases
standalone-adjective.a: adjective.a

.PHONY: all subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

all: ninfl.a

