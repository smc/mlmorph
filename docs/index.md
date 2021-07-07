
# Malayalam morphology analyser

Morphology is the study of the internal structure of words.. Morphology focuses on how the components within a word (stems, root words, prefixes, suffixes, etc.) are arranged or modified to create different meanings.

Malayalam is a highly [inflectional][1] and [agglutinative][2] language. This has posed a challenge for all kind of language processing. Algorithmic interpretation of Malayalam words and their formation rules is very complex. My own attempts to study and try out some of these characteristics was big failure in the past. Back in 2007, when I tried to develop a [spellchecker for Malayalam][3], the infinite number of words this language can have by combining multiple words together and those words inflected was a big challenge. The dictionary based spellechecker was a failed attempt. I had [documented these issues][4].

* **[Lexicon](lexicon/):** This is a large collection of root words, collected and manually curated, classified into various part of speech categories. So the collection is seperated to nouns, verbs, conjunctions, interjections, loan words, adverbs, adjectives, question words, affirmatives, negations and so on. Nouns themselves are divided to pronouns, person names, place names, time names, language names and so on. Each of them get a unique tag and will appear when you analyse such words.
* **[Morphotactics](morph/):** Morphology rules about agglutination and inflection. This includes agglutination rules based on Samasam(സമാസം) &#8211; accusative, vocative, nominative, genitive, dative, instrumental, locative and sociative. Also plural inflections, demonstratives(ചുട്ടെഴുത്തുകൾ) and indeclinables(അവ്യയങ്ങൾ). For verbs, all possible tense forms, converbs, adverbal particles, concessives(അനുവാദകങ്ങൾ) and so on.
* **[Phonological rules](phon/)**: This is done on top of the results from morphotactics. For example, from morphotactics,` ആൽ<noun>`, `തറ<noun>`, `ഇൽ<locative>` will give `ആൽ<noun>തറ<noun>ഇൽ<locative>`. But after the phonological treatment it becomes, ആൽത്തറയിൽ with consonant duplication after ൽ, and ഇ becomes യി.
* [Automata definition](fst) for the above: This is where you say nouns can be concatenated any number of times, following optional inflection etc in regular expression like language.
* [API](api)s: Programmable interface, web api, command line tools, web interface for demos.

## History

I was busy with my type design projects between 2014 and 2016, but continued to search for the solution of this problem. In 2016, during [Google summer of code mentor summit][5] at Google campus, California, mentors working on language technology had a meeting and I explained this challenge. It was suggested that I need to look at Finnish, Turkish, German and such similarly inflected and agglutinated languages and their attempts to solve this. So, after the meeting, I started studying some of the projects &#8211; [Omorfi][6] for Finnish, [SMOR][7] for German, [TRMorph][8] for Turkish. All of them use [Finite state transducer][9] technology.

## License

This project is licensed under [the MIT License](http://choosealicense.com/licenses/mit/)

## Published papers

* **Finite State Transducer based Morphology analysis for Malayalam Language** - Santhosh Thottingal, Proceedings of the 2nd Workshop on Technologies for MT of Low Resource Languages, European Association for Machine Translation, August 20, Dublin, Ireland. [Paper](https://www.aclweb.org/anthology/W19-6801/)


 [1]: https://en.wikipedia.org/wiki/Inflectional_language
 [2]: https://en.wikipedia.org/wiki/Agglutinative_language
 [3]: http://thottingal.in/blog/2007/05/28/malayalam-spellchecker/
 [4]: http://thottingal.in/documents/MalayalamComputingChallenges.pdf
 [5]: https://sites.google.com/site/2016gsocmentorsummit/home
 [6]: https://github.com/flammie/omorfi
 [7]: http://www.cis.uni-muenchen.de/~schmid/tools/SMOR/
 [8]: https://github.com/coltekin/TRmorph
 [9]: https://en.wikipedia.org/wiki/Finite_state_transducer
 [10]: http://thottingal.in/blog/2014/05/17/navigator-languages-is-coming/
 [13]: https://en.wikipedia.org/wiki/HFST ""
 [14]: /wp-content/uploads/2017/11/Spectacle.jd3382.png