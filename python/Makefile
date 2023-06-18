all:
	@mkdir -p mlmorph/data
	cp ../malayalam.a  mlmorph/data/malayalam.a
	pip install build
	python -m build --sdist
	pip install -e .

clean:
	@rm -f mlmorph/data/*.a

upload:
	rm -rf dist
	pip install build twine
	python -m build --sdist
	python -m twine upload dist/*