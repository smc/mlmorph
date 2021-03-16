all:
	@mkdir -p mlmorph/data
	cp ../malayalam.a  mlmorph/data/malayalam.a
	python3 setup.py sdist
	pip3 install -e .

clean:
	@rm -f mlmorph/data/*.a

upload:
	rm -rf dist
	python setup.py sdist
	python3 -m twine upload dist/*