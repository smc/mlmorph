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
You need [SFST]( http://www.ims.uni-stuttgart.de/projekte/gramotron/SOFTWARE/SFST.html) to compile and use this analyzer. The Makefile
provided compiles compiles all the sources and produces the binary FSA
'malayalam.a'. Assuming you have fst-compiler-utf8 from SFST in your
path, in POSIX systems typing 'make' should be enough to get started.

In a debian/ubuntu based GNU/Linux, SFST can be installed as follows

```$ sudo apt install sfst```

Clone or download this git repository to your machine.

Usage
=====
Build the FST by

```$ make```

This will create a file named `malayalam.a` which is the compiled analyser. Individual modules will get also created like `num.a` which is number analyser.

To analyse Malayalam words, start the interactive analyser

```
$ fst-mor malayalam.a
reading transducer...
finished.
analyze> പേനകൾ
പേന<Noun><pl>
analyze> കീശയിൽ
കീശ<Noun><locative>
മാലയ്ക്ക്
മാല<Noun><dative>
analyze>
analyze> മഴകൾ
മഴ<n><pl>
analyze> നീലത്താമര
നീല<n>താമര<n>
analyze> ആൽത്തറ
ആൽ<n>തറ<n>
analyze> നീലപ്പീലി
നീല<n>പീലി<n>
analyze> പച്ചമരം
പച്ച<n>മരം<n>
analyze> പച്ചയ്ക്ക്
പച്ച<n><dative>
analyze> നല്ലമരംകൊണ്ട്
നല്ല<adj>മരം<n>കൊണ്ട്<cnj>
analyze> ആഹ!
ആഹ<ij>!<Punct>
analyze> അടിപ്പരപ്പ്
അടി<n>പരപ്പ്<n>
analyze> പ്ലാവുമരം
പ്ലാവ്<n>മരം<n>
```

Two swtich to generate mode, just press enter at prompt without entering any text.

```
analyze>
generate> ആശ<Noun><instrumental>
ആശയാൽ

```

Any words that is not known to the model will be rejected.

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

To know all kind of text that the analyser can generate using the defined model,

```$ fst-generate malayalam.a > malayalam.generated.txt```

Note that this is a long list.

The entire FST can be visualized by generating a dot file by
``` make view```

This will generate a file named malayalam.dot, which can be either viewed using applications like `xdot` or can be converted to a pdf using `dot -Tpdf malayalam.a malayalam.pdf`. As the complxity of the morphology increases, the diagram will make less sense.

Using with HFST
---------------
It can also be compiled with [Helsinki Finite-State Transducer Technology (HFST) ](http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/). To compile using HFST tools, set
FSTC envirionment to 'hfst', a command like ```FSTC=hfst make``` should do
the trick. The resulting FSA will be usable with the HFST tools.  This document assumes that you are using SFST.

License
=======
This work is licensed under a GNU General Public License v3.0. See COPYING file in the source code.
