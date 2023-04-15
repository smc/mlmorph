# Malayalam Morphological Analyzer using Finite State Transducer

[![PyPI Version](https://img.shields.io/pypi/v/mlmorph.svg)](https://pypi.python.org/pypi/mlmorph)


<div style="text-align:center;">
    <img src="mlmorph-logo.svg"/>
    <h1>mlmorph</h1>
</div>

## Introduction

mlmorph is Malayalam Morphology Analyzer and Generator. It aims to build a morphological model for Malayalam language using  [Finite State Transducer technology](https://en.wikipedia.org/wiki/Finite-state_transducer). Specifically, the system is developed using [Stuttgart Finite State Toolkit(SFST)]( http://www.ims.uni-stuttgart.de/projekte/gramotron/SOFTWARE/SFST.html) formalism.

Malayalam is a heavily inflected and agglutinated language and this project attempt to iteratively develop a morphological model for it.

For a detailed introduction and explanation of approach, please refer the blog post https://thottingal.in/blog/2017/11/26/towards-a-malayalam-morphology-analyser/

## Status

Currently the analyser can parse(or recognize) 80%+ of words in our test corpora of 50000 Malayalam words. The lexicon prepared is being updated and expanded to include more commonly used words. Morpho-Phonological rules are still being added, even though the common constructs are already added.

* A web interface is available at https://morph.smc.org.in to quickly try out the analyser and generator.
* A spellchecker based on this analyser is being developed. See https://gitlab.com/smc/mlmorph-spellchecker
* A libreoffice extension to use the spellchecker is also being developed. See https://gitlab.com/smc/mlmorph-libreoffice-spellchecker

## Installation and usage

The easiest way to start using mlmorph is by installing the python library that comes with the compiled automata.

```
pip install mlmorph
```

For API documentation and command line usage, See https://pypi.org/project/mlmorph

### Morphological analysis example

```python
from mlmorph import Analyser
analyser = Analyser()
analyser.analyse("കേരളത്തിന്റെ")
```

Gives `[('കേരളം<np><genitive>', 179)]`

The second item in this result is the weight. Sometimes a single word can have multiple analysis. The analysis with less weight is the preferred analysis.

### Morphological generator example

```python
from mlmorph import Generator
generator = Generator()
generator.generate("കേരളം<np><genitive>")
```

Gives `(('കേരളത്തിന്റെ', 0.0),)`

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

``` bash
$ python -m mlmorph -a
നിറങ്ങൾ
നിറങ്ങൾ   നിറം<n><pl>
```

## Applications

### Spellchecker

A spellchecker based on this analyser is being developed. See https://gitlab.com/smc/mlmorph-spellchecker. You can try out an online version at morph.smc.org.in/spellcheck

A libreoffice extension to use the spellchecker is also being developed. See https://gitlab.com/smc/mlmorph-libreoffice-spellchecker

### Analysing numbers

The textual form of Malayalam numbers has an interesting characterstic that it is a limited vocabulary set creating infinite number of words by agglutination of number parts. A number like 12345 is written as പന്ത്രണ്ടായിരത്തിമുന്നൂറ്റിനാൽപത്തഞ്ച്. This is composed from 12-പന്ത്രണ്ട്, 1000=ആയിരം, 300=മുന്നൂറ്, 40-നാല്പത്, 5 - അഞ്ച്. Agglutination happens at 5 places in this word. When agglutination happens the morpheme boundaries change in left side or right side or both. The number module of mlmorph analyser is powerful enough to analyse and generate any arbitrary number in its text format(or aims to do so). Some examples are given below.

For more details and a demo, please refer https://thottingal.in/blog/2017/12/10/number-spellout-and-generation-in-malayalam-using-morphology-analyser/

### Named Entity Recognition

Named Entity Recognition, a task of identifying and classifying real world objects such as persons, places, organizations from a given text is a well known NLP problem. Since mlmorph gives the POS tagging and analysis, there is not much to do in NER. We just need to look for tags corresponding to proper nouns and report.
You can try the system at https://morph.smc.org.in/ner

Detailed documentation: https://thottingal.in/blog/2019/03/10/malayalam-named-entity-recognition-using-morphology-analyser/

## For Developers

You need [Stuttgart Finite State Toolkit(SFST)](http://www.ims.uni-stuttgart.de/projekte/gramotron/SOFTWARE/SFST.html) to compile and use this analyzer.

The Makefile provided compiles compiles all the sources and produces the binary FSA 'malayalam.a'. Running 'make' should be enough to get started.

In a debian/ubuntu based GNU/Linux, SFST can be installed as follows

```$ sudo apt install sfst```

Clone or download this git repository to your machine.

Build the FST by

```$ make```

This will create a file named `malayalam.a` which is the compiled generator. Individual modules will get also created like `num.a` which is number generator.

## Tests

The analyser is being developed with lot of tests. To run tests :

```bash
$ make test
```

```bash
$ make coverage-test
```
runs a coverage-tests and creates unanalyzed.lex file in tests with unanalyzed words.
## Dataset
```bash
$ make dataset 
```
creates a .csv file with words from tests/coverage/*.txt files. 

## Citation

Please cite the following publication in order to refer to the mlmorph:

```
@inproceedings{thottingal-2019-finite,
    title = "Finite State Transducer based Morphology analysis for {M}alayalam Language",
    author = "Thottingal, Santhosh",
    booktitle = "Proceedings of the 2nd Workshop on Technologies for MT of Low Resource Languages",
    month = "20 " # aug,
    year = "2019",
    address = "Dublin, Ireland",
    publisher = "European Association for Machine Translation",
    url = "https://www.aclweb.org/anthology/W19-6801",
    pages = "1--5",
}
```

## License

mlmorph is under MIT license.
