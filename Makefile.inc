DISTNAME=mlmorph-`cat VERSION`
FSTC ?= sfst
ifeq ($(FSTC),hfst)
%.a: %.fst
	hfst-calculate -w -v -i $< -o $@
else
%.a: %.fst
	fst-compiler-utf8 $< $@
endif

%.dot: %.a
	hfst-fst2txt -D -f dot -i $< -o $@

%.generate.txt: %.a
	fst-generate $< > $@
