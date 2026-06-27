SUBDIRS = lexicon phon ninfl vinfl deriv python rust

include Makefile.inc

.PHONY: all subdirs $(SUBDIRS) docs webserver

all: malayalam.a python rust

malayalam.a: morph.a afilter.a
noun.a: ninfl lexicon deriv phon num.a verb.a
verb.a: vinfl lexicon phon
morph.a: verb.a noun.a num.a
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

test: malayalam.a python
	@python tests/mlmorph-test.py

coverage-analysis: malayalam.a python
	@python tests/coverage-test.py

docs:
	cd docs && npm ci && npm run docs:build
	cp -r docs/.vitepress/dist web/public

webserver: all docs
	cd web && uv sync --frozen && uv run uvicorn mlmorphweb:app --host 0.0.0.0 --port 8000

dataset:
	pip install tqdm
	python scripts/create-dataset.py
