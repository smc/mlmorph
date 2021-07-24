## History

In 2016, during [Google summer of code mentor summit][1] at Google campus, California, mentors working on language technology had a meeting and I explained this challenge. It was suggested that I need to look at Finnish, Turkish, German and such similarly inflected and agglutinated languages and their attempts to solve this. So, after the meeting, I started studying some of the projects: [Omorfi][2] for Finnish, [SMOR][3] for German, [TRMorph][4] for Turkish. All of them use [Finite state transducer][5] technology.

I found SFST well documented and having TRMorph source code as good reference. Started writing simple transducers in SFST. The first one I wrote was [Malayalam number generation](./ninfl/number.md) and analysis. The proceeded with other parts of the system.

SFST had one limitation - It did not had functional programming APIs or bindings. Meanwhile, HFST had SFST backend and came with python bindings. So I started using HFST for programmable interfaces while the paradigm is SFST. Transducer was compiled using HFST.

In one of the major refactoring of HFST in 2017 end, the compilation of SFST paradigm in HFST [stopped functioning](https://github.com/hfst/hfst/issues/369). I started using SFST for compiling and using HFST for programmable interface

HFST development started slowing down in 2019. It stopped releasing python bindings. Building python bindings from source were also nearly impossible due to complexities in tooling. Wheel files provided in pypi was only till Python 3.7 version. Compiling from source for [python 3.8 was not working](https://github.com/hfst/hfst/issues/448). Many linux distros started shipping latest python version by default. Because of this mlmorph was not able to support any version above python 3.7. I tried to contact the developers in different ways, but issue was not resolved.

In 2021, I decided to abandon HFST and depend only on SFST. This required writing python bindings for SFST. SFST code required some modernisation for cross platform compilation. I switched the build system to Cmake from Automake. Wrote the python bindings using [pybind11](https://github.com/pybind/pybind11). I sent the code to SFST's author since it was not version tracked. But Helmut Schmid, the author of SFST made my version of SFST as latest upstream. So currently I maintain SFST at [https://github.com/santhoshtr/sfst](https://github.com/santhoshtr/sfst)



 [1]: https://sites.google.com/site/2016gsocmentorsummit/home
 [2]: https://github.com/flammie/omorfi
 [3]: http://www.cis.uni-muenchen.de/~schmid/tools/SMOR/
 [4]: https://github.com/coltekin/TRmorph
 [5]: https://en.wikipedia.org/wiki/Finite_state_transducer

