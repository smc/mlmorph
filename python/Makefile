all:
	@mkdir -p mlmorph/data
	cp ../malayalam.a mlmorph/data/malayalam.a
	pip install -e '.[tests,dev]'

test:
	tox

clean:
	@rm -f mlmorph/data/*.a

upload:
	rm -rf dist
	python -m build --sdist
	python -m twine upload dist/*