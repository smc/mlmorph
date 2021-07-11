# Frequently asked questions

**Why this documentation is written in English?**

It may be argued that a documentation on Malayalam morphology could be written better in Malayalam language itself. From my past experiences with documenting Malayalam computational linguistic and typography related topics, I found that if it is written in a lingua franca like English, it serves more people. The target audience for this documentation is moderately educated people in linguistics. Often they are not native Malayalam speakers. Secondly, I found it very hard to connect with linguistic discourses in non-Malayalam languages when I referred Malayalam only grammar books. These books often does not give corresponding English vocabulary for key topics. Not having a bridge from Malayalam to general linguistic discouse in world languages made my learning difficult.

**Can I learn grammar from this documentation?**

No. This is an interpretation of Malayalam grammar for computational purpose. It does not claim completeness or correctness. The approach is descriptive grammar because of the usecase. This documentation mostly try to see every word as a sequence of bytes and every grammatical function as some string processing function. There are many other important aspects to grammar and this does not serve that function.

**Why mlmorph is not using machine learning based approach?**

* Machine learning based solutions are used when the problem is not deterministically solvable. That is, the solution is probabilistic. But I do not believe Morphology analysis and generation is that kind of problem. There are ambiguities, but the whole problem is not probabilistic.
* Machine learning solutions should learn from something. In Malayalam this is the first time a functional morphology analyser is developed and available.

**Isn't it a never ending task to maintain a lexicon and grammar rules?**

Yes, it is.

**Can I contribute to this project?**

Yes. I won't delegate or assign any work to you. If you see that some things can be improved or added, you already figured out what to contribute. Follow usual FOSS contributions steps. Feel free to ask for help.

**Is this project sponsored or funded by anybody?**

No.

