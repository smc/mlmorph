all:
	# Convert the fst to FOMA type and place it in python data folder
	hfst-fst2fst -F ../malayalam.a > mlmorph/data/malayalam.a
	python setup.py sdist
	pip install -e .