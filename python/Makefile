all:
	# Convert the fst to FOMA type and place it in python data folder
	@mkdir -p mlmorph/data
	hfst-fst2fst -F ../malayalam.a > mlmorph/data/malayalam.a
	python3 setup.py sdist
	pip3 install -e .

clean:
	@rm -f mlmorph/data/*.a

upload:
	rm -rf dist
	python setup.py sdist upload