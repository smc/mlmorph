Introduction blog post: http://thottingal.in/blog/2017/11/26/towards-a-malayalam-morphology-analyser/

SFST
====
1. Developing Computational Morphologies With the SFST Tool http://www.cis.uni-muenchen.de/~schmid/tools/SFST/data/SFST-Tutorial.pdf
2. SFST Manual http://www.cis.uni-muenchen.de/~schmid/tools/SFST/data/SFST-Manual.pdf

Books to Refer
=============
1. The Evolution of Malayalam Morphology by L V Ramaswami Ayyar, 1936. https://archive.org/details/TheEvolutionOfMalayalamMorphology1936
2. Keralapanineeyam by A R Rajarajavarma 1917 http://books.sayahna.org/ml/pdf/keralapanineeyam.pdf
3. A Grammar of Malayalam In The Language Itself By The Rev. George Matthan, Kottayam CM Press 1868 https://archive.org/details/GrammerOfMalayalamInTheLanguageItself
4. Catechism of Malayalam Grammar by H Gundert, 1867 https://archive.org/details/1867_Catechism_Of_Malayalam_Grammar
5. Malayalam by R E Asher and T C Kumari, 1997
6. A Grammar of Malayalam by Ravi Sankar S Nair, 2012 http://www.languageinindia.com/nov2012/ravisankarmalayalamgrammar.pdf

Some initial excercises to start contibuting
============================================

Add support for a person name
-----------------------------

1. Find out a person name that is not listed in lexicon/person-names.lex. You can see that `mlmorph -a` with that name returning nothing. 
2. Now add that name to lexicon/person-names.lex files, save and run `make clean test`
3. Run `mlmorph -a` and enter the new name there. You should see an analysis. Try various inflected forms of that name there. Verify the results.

Repeat the same for adding support a new noun, verb, place name etc. Try adding automated test for the new entries.

