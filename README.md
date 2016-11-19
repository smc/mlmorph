Malayalam Morphological Analyzer using Finite State Transducer

You need SFST [1] to compile and use this analyzer. The Makefile
provided compiles compiles all the sources and produces the binary
'trmorph.a'. Assuming you have fst-compiler-utf8 from SFST in your
path, in POSIX systems typing 'make' should be enough to get started.
It can also be compiled with HFST [2]. To compile using HFST tools, set
FSTC envirionment to 'hfst', a command like 'FSTC=hfst make' should do
the trick. The resulting FSA will be usable with the HFST tools. The
rest of this document assumes that you are using SFST.

-------------------------
[1] http://www.ims.uni-stuttgart.de/projekte/gramotron/SOFTWARE/SFST.html
[2] http://code.google.com/p/zemberek/,  
