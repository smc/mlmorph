Malayalam Morphological Analyzer using Finite State Transducer

Introduction
============
mlmorph is Malayalam Morphological Analyzer in development. It aims to build a morphological model for Malayalam language using  [Finite State Transducer technology](https://en.wikipedia.org/wiki/Finite-state_transducer). Specifically, the system is developed using [Stuttgart Finite State Toolkit(SFST)]( http://www.ims.uni-stuttgart.de/projekte/gramotron/SOFTWARE/SFST.html) formalism and uses [Helsinki Finite-State Technology(HFST)](Helsinki Finite-State Technology) as Toolkit. Malayalam is a heavily inflected and agglutinated language and the project attempt to iteratively develop a morphological model for it.

Status
======
The project is in early stage of development. As of now it can analyse/generate Malayalam numbers in textual form(Example: അമ്പത്തെട്ടായിരത്തിനാനൂറ്റൊമ്പത്). The phonological rules are being developed and contains a small lexicon. It can analyze multi level agglutinated inflected rules based on phonological rules. The phono-morphological rules need to be derived from the sandhi rules of Malayalam and that is expeceted as non-trivial task.

See usage section below for some more examples.

Installation
============
You need  [Helsinki Finite-State Transducer Technology (HFST) ](http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/) to compile and use this analyzer. The Makefile
provided compiles compiles all the sources and produces the binary FSA
'malayalam.a'. Running 'make' should be enough to get started.

In a debian/ubuntu based GNU/Linux, HFST can be installed as follows

```$ sudo apt install hfst```

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

For more convinient usage, a python wrapper around this is provided. See section below

Any words that is not known to the model will be rejected.

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

```
analyze> രണ്ട്
രണ്ട്<ones>
analyze> ഇരുപത്തെട്ട്
ഇരുപത്തി<tens>എട്ട്<ones>
analyze> അമ്പത്താറര
അമ്പത്തി<tens>ആറ്<ones>അര<half>
analyze> നൂറ്റിതൊണ്ണൂറ്റൊമ്പത്
നൂറ്റി<hundreds>തൊണ്ണൂറ്റി<tens>ഒമ്പത്<ones>
analyze> തൊള്ളായിരത്തിതൊണ്ണൂറ്റൊന്നര
തൊള്ളായിരത്തി<hundreds>തൊണ്ണൂറ്റി<tens>ഒന്ന്<ones>അര<half>
analyze> എഴുപത്താറായിരത്തഞ്ഞൂറ്റെഴുപത്തൊന്നര
എഴുപത്തി<tens>ആറ്<ones>ആയിരത്തി<thousands>അഞ്ഞൂറ്റി<hundreds>എഴുപത്തി<tens>ഒന്ന്<ones>അര<half>

```

The constrained vocabulary of numbers sharing all multi level agglutination and inflection is a good starting point to model and test in my experience.

Python Interface
===============

HFST Python binding
-------------------
HFST python binding is available at pypi.
https://pypi.python.org/pypi/hfst

It can be installed using

```bash
$ pypi install hfst
```

Or build from source code of hfst. Install swig, python3-dev packages, go to python folder of HFST source code, run,

```bash
sudo python3 setup.py install
```

Refer: https://kitwiki.csc.fi/twiki/bin/view/KitWiki/HfstPython
and https://hfst.github.io/python/3.12.1/QuickStart.html

CLI interface
-------------
```bash
$ python3 mlmorph.py -h
usage: mlmorph.py [-h] [-f FSAPATH] [-i INFILE] [-a] [-g] [-v]

optional arguments:
  -h, --help            show this help message and exit
  -f FSAPATH, --fsa FSAPATH
                        Path to directory of HFST format automata
  -i INFILE, --input INFILE
                        source of analysis data
  -a, --analyse         Analyse the input file strings
  -g, --generate        Generate the input file strings
  -v, --verbose         print verbosely while processing
```
Example usages: Assumitng words.txt file exist and it has words to analyse as each lines.
```
python3 mlmorph.py -f ../malayalam.a -a -i words.txt
നീലത്താമര	നീല<n>താമര<n>
ആൽത്തറ	ആൽ<n>തറ<n>
ആൽത്തറകൾ	ആൽ<n>തറ<n><pl>
ആനകൾ	ആന<n><pl>
ആനയെ	ആന<n><accusative>
ആനയാൽ	ആന<n><instrumental>
ആനകൊണ്ട്	ആന<n><instrumental>
ആനയെക്കൊണ്ട്	ആന<n><accusative>കൊണ്ട്<cnj>
പതിനൊന്ന്	പതി<tens>നൊന്ന്<ones><num>
പതിനൊന്നര	പതി<tens>നൊന്ന്<ones><num>അര<n>
അറുപത്	അറുപത്<tens><num>
ഇലയിൽ	ഇല<n><locative>
പൂച്ചയുടെ	പൂച്ച<n><genitive>
ആനയുടെ	ആന<n><genitive>
പേരിന്റെ	പേര്<n><genitive>
മഴയ്ക്ക്	മഴ<n><dative>
കാടിന്	കാട്<n><dative>
കടലിനെ	കടൽ<n><accusative>
ആടിനെ	ആട്<n><accusative>
മരത്തെ	മരം<n><accusative>
വടിയാൽ	വടി<n><instrumental>
വടികൊണ്ട്	വടി<n><instrumental>
വടികൾകൊണ്ട്	വടി<n><pl>കൊണ്ട്<cnj>
അട്ടപ്പാടിയിൽ	അട്ടപ്പാടി<np><locative>
മരങ്ങൾ	മരം<n><pl>
കാടുകൾ	കാട്<n><pl>
നടുവിൽ	നടു<n><locative>
മുറ്റത്തിൽ	മുറ്റം<n><locative>
അദ്ദേഹത്തിന്റെ	അദ്ദേഹം<prn><genitive>
കേരളത്തിൽ	കേരളം<np><locative>
കേരളത്തിലെ	കേരളം<np><locative>
മുറ്റത്തിനെ	മുറ്റം<n><accusative>
ആടിക്കൊണ്ടിരിക്കും	ആടുക<v><past>കൊണ്ടിരിക്കുക<v><future>
ആടിക്കൊണ്ടിരിക്കുക	ആടുക<v><past>കൊണ്ടിരിക്കുക<v>
ആടിക്കൊണ്ടിരിക്കുന്ന	ആടുക<v><past>കൊണ്ടിരിക്കുക<v><present>
മുറ്റത്തെ	മുറ്റം<n><accusative>
കേരളത്തിനു്	കേരളം<np><dative>
അറിയിച്ചു	അറിയിക്കുക<v><past>
കരഞ്ഞു	കരയുക<v><past>
അടുത്തു	അടുക്കുക<v><past>
ഉഴന്നു	ഉഴലുക<v><past>
പാടി	പാടുക<v><past>
കൂടിച്ചേരും	കൂടുക<v><past>ചേരുക<v><future>
പാടിത്തകർക്കും	പാടുക<v><past>തകർക്കുക<v><future>
തെറ്റി	തെറ്റുക<v><past>
വീണു	വീഴുക<v><past>
പോയിവരും	പോകുക<v><past>വരുക<v><future>
ചത്തു	ചാവുക<v><past>
വളർന്നു	വളരുക<v><past>
ഇരുന്നു	ഇരിക്കുക<v><past>
ഓടിത്തളർന്നു	ഓടുക<v><past>തളരുക<v><past>
കടലിങ്കൽ	കടൽ<n><locative>
കടലിൽ	കടൽ<n><locative>
കല്ലിൽ	കല്ല്<n><locative>
കാട്ടിങ്ങൽ	കാട്<n><locative>
കാട്ടിൽ	കാട്<n><locative>
തോട്ടിങ്കൽ	തോട്<n><locative>
തോട്ടിങ്ങൽ	തോട്<n><locative>
തോട്ടിൽ	തോട്<n><locative>
എന്നെ	ഞാൻ<prn><accusative>
തന്നെ	താൻ<prn><accusative>
നമ്മെ	നാം<prn><accusative>
തേവരുടെ	തേവർ<n><genitive>
അവനുടെ	അവൻ<prn><genitive>
അവരിന്റെ	അവർ<prn><genitive>
അവരുടെ	അവർ<prn><genitive>
എന്റെ	ഞാൻ<prn><genitive>
ഞങ്ങളുടെ	ഞങ്ങൾ<prn><genitive>
തന്നുടെ	താൻ<prn><genitive>
തന്റെ	താൻ<prn><genitive>
ഓടിക്കയറി	ഓടുക<v><past>കയറുക<v><past>
സഹിക്കാൻ	സഹിക്കുക<v><cvb-adv-part-future>
പാടാൻ	പാടുക<v><cvb-adv-part-future>
ചിരിക്ക	ചിരിക്കുക<v><cvb-adv-part-absolute>
സഹിക്കിൽ	സഹിക്കുക<v><cvb-adv-part-conditional>
ചെടിയേ	ചെടി<n><vocative>
മരമേ	മരം<n><vocative>
ഇതളുകൾ	ഇതൾ<n><pl>
കാലുകൾ	കാല്<n><pl>
പയറുകൾ	പയറ്<n><pl>

```

License
=======
This work is licensed under a GNU General Public License v3.0. See COPYING file in the source code.
