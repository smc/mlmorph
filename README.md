Malayalam Morphological Analyzer using Finite State Transducer

Introduction
============
mlmorph is Malayalam Morphological Analyzer and Generator. It aims to build a morphological model for Malayalam language using  [Finite State Transducer technology](https://en.wikipedia.org/wiki/Finite-state_transducer). Specifically, the system is developed using [Stuttgart Finite State Toolkit(SFST)]( http://www.ims.uni-stuttgart.de/projekte/gramotron/SOFTWARE/SFST.html) formalism and uses [Helsinki Finite-State Technology(HFST)](Helsinki Finite-State Technology) as Toolkit. Malayalam is a heavily inflected and agglutinated language and the project attempt to iteratively develop a morphological model for it.

For a detailed introduction and explanation of approach, please refer https://thottingal.in/blog/2017/11/26/towards-a-malayalam-morphology-analyser/

Status
======
The project is in early stage of development. As of now it can analyse and generate a large variety of words. Please have a look at the tests/data.tv for a listing. It can also analyse/generate Malayalam numbers in textual form(Example: അമ്പത്തെട്ടായിരത്തിനാനൂറ്റൊമ്പത്). The phonological rules are being developed and contains a small but growing lexicon. It can analyze arbitrary level agglutinated inflected rules based on phonological rules. The phono-morphological rules need to be derived from the sandhi rules of Malayalam and that is expected as non-trivial task.

Installation
============
You need  [Helsinki Finite-State Transducer Technology (HFST) ](http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/) to compile and use this analyzer.
The Makefile provided compiles compiles all the sources and produces the binary FSA 'malayalam.a'. Running 'make' should be enough to get started.

In a debian/ubuntu based GNU/Linux, SFST and HFST can be installed as follows

```$ sudo apt install sfst hfst python3-libhfst```

Usage
=====
Clone or download this git repository to your machine.

Build the FST by

```$ make```

This will create a file named `malayalam.a` which is the compiled generator. Individual modules will get also created like `num.a` which is number generator.

To generatate Malayalam words, use ```hfst-lookup```

```
$ echo "പേന<n><pl>" | hfst-lookup malayalam.a
> പേന<n><pl>    പേനകൾ   0.000000
$ echo "കീശ<n><locative>" | hfst-lookup malayalam.a
> കീശ<n><locative>   കീശയിൽ	0.000000
```

The same analyser can be used inverted to reverse the above operation.

```$ hfst-invert malayalam.a > malayalam.g```

Two swtich to generate mode, just press enter at prompt without entering any text.

```
$ echo "ആശയാൽ" | hfst-lookup malayalam.g
> ആശയാൽ ആശ<n><instrumental>	0.000000
```

For more convinient usage, a python wrapper around this is provided. See section below. Any words that is not known to the model will be rejected.

To generate 10 random strings the FST can produce:

`hfst-fst2strings malayalam.a  -r 10`

Tests
-----
The analyser is being developed with lot of tests. To run tests :
```bash
$ make test
```
Analysing numbers
----------------
The textual form of Malayalam numbers has an interesting characterstic that it is a limited vocalbulary set creating infinite number of words by agglutination of number parts. A number like 12345 is written as പന്ത്രണ്ടായിരത്തിമുന്നൂറ്റിനാൽപത്തഞ്ച്. This is composed from 12-പന്ത്രണ്ട്, 1000=ആയിരം, 300=മുന്നൂറ്, 40-നാല്പത്, 5 - അഞ്ച്. Agglutination happens at 5 places in this word. When agglutination happens the morpheme boundaries change in left side or right side or both. The number module of mlmorph analyser is powerful enough to analyse and generate any arbitrary number in its text format(or aims to do so). Some examples are given below.

For more details and a demo, please refer https://thottingal.in/blog/2017/12/10/number-spellout-and-generation-in-malayalam-using-morphology-analyser/

Python Interface
===============

See https://pypi.org/project/mlmorph

License
=======
mlmorph is under MIT license.