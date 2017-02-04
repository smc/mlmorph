Language
=========
Newly formulated rules: https://docs.google.com/document/d/1yWi67PO7EUHgak7lNI8_U6JF-Typo9qGFQ4Op2t4vGs/edit#
Cross check with Keralapanineeyam and have test coverage matching its examples.

Lexicon
=======
1. Nouns with അ is taken from ml.wiktionary.org വർഗ്ഗം:മലയാളം നാമങ്ങൾ. Others need to add.
2. Abbreviations not integrated well

TODO
=====

1. Expand lexicon
2. More proper nouns - places, people where to get?
3. Verbs
4. A web utility to demo
5. Documentation
6. Expand number to cover all edge cases.
7. Abbreviations
8. How to handle borrowed latin words?
9. Standardize POS tags and document
10. Exception dictionary
11. Better way to test. Create CSV or TSV files with input and output, use ptyhon bindings to match results.
12. Use names for variables that are not confusing
13. include #infl# in the vowel to vowel sign context - as possible tag in the word joining position.
14. Avoid proper nouns like place names, person names agglutinating with another proper names.


Ideas
=====
1. A grapheme to phoneme transcription utility, try extending with stress markers
2. Date parser that accepts strings like നവമ്പർ മാസം പത്താം തീയതി and gives Nov 10. The date in machine readable format.
3. Same as above for time. വൈകീട്ട് മൂന്നരമണി, രാവിലെ ആറേ മുക്കാൽ. നാളെ രാത്രി പന്ത്രണ്ടരമണി...
4. IPA transliteration/transcription
5. Spell checker
6. Hyphenation
7. Syllabalzer


Working with HFST
=================
To compile:

`FSTC=HFST make`

Generate 10 random strings the FST can produce:

`hfst-fst2strings malayalam.a  -r 10`

Lookup:

`echo "നീല<n><pl>" | hfst-lookup malayalam.a`

Optimize the FST

`hfst-fst2fst -S -i malayalam.a -o malayalam.ao`

Using fst-proc:
```
$ echo "നീല<n><pl>" | hfst-proc -a malayalam.ao
^നീല<n><pl>/നീലകൾ$
```

Bindings
=========

Ruby
-----
There is a ruby wrapper for SFST: https://github.com/mlj/ruby-sfst
To install gem install ruby-sfst.
Sample code:
```ruby
require "sfst"

fst = SFST::RegularTransducer.new("malayalam.a")
analyse=fst.analyse('നീലത്താമര')
puts analyse

```
and running it like
```bash
$ruby test.rb
```
gives

`നീല<n>താമര<n>`

Python
------
There is a SWIG based binding given at http://home.gna.org/pysfst/ looks outdated. Last update was in 2008.
There is another binding which looks recent at https://github.com/hbuschme/pysfstmorph.
Both of them does not seem to work. Better use the HFST compiler and use HFST python bindings.

HFST python bindings are not packaged for debian. Install swig, python3-dev packages, go to python folder of HFST source code, run,

```bash
python3 setup.py build_ext --inplace
sudo python3 setup.py install
```

Refer: https://kitwiki.csc.fi/twiki/bin/view/KitWiki/HfstPython
and https://hfst.github.io/python/3.12.1/QuickStart.html


Nodejs
------
No known bindings. Worth to write one from scratch?
