all:
	@mkdir -p mlmorph/data
	cp ../malayalam.a  mlmorph/data/malayalam.a
	python setup.py sdist
	pip3 install -e .

clean:
	@rm -f mlmorph/data/*.a

upload:
	rm -rf dist
	python setup.py sdist
	python -m twine upload dist/*