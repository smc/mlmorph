# Python Interface for Malayalam morphology analyser

## Installation

Python 3 is required. Using with `venv` is recommended

```bash
$ pip install mlmorph
```

## Morphological analysis example

```python
from mlmorph import Analyser
analyser = Analyser()
analyser.analyse("കേരളത്തിന്റെ")
```

Gives

```python
[('കേരളം<np><genitive>', 179)]
```


The second item in this result is the weight. Sometimes a single word can have multiple analysis. The analysis with less weight is the preferred analysis.

## Morphological generator example

```python
from mlmorph import Generator
generator = Generator()
generator.generate("കേരളം<np><genitive>")
```

Gives

```python
(('കേരളത്തിന്റെ', 0.0),)
```

## Command line interface

```bash

$ python -m mlmorph --help
usage: __main__.py [-h] [-i INFILE] [-a] [-g] [-v]

optional arguments:
    -h, --help            show this help message and exit
    -i INFILE, --input INFILE
                        source of analysis data
    -a, --analyse         Analyse the input file strings
    -g, --generate        Generate the input file strings
    -v, --verbose         print verbosely while processing
```

Accepts strings from stdin too. For example:

```bash
$ python -m mlmorph -a
നിറങ്ങൾ
നിറങ്ങൾ   നിറം<n><pl>
```
