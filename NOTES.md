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
11. Better way to test. See [Bindings]()
12. Use names for variables that are not confusing


Ideas
=====
1. A grapheme to phoneme transcription utility, try extending with stress markers
2. Date parser that accepts strings like നവമ്പർ മാസം പത്താം തീയതി and gives Nov 10. The date in machine readable format.
3. Same as above for time. വൈകീട്ട് മൂന്നരമണി, രാവിലെ ആറേ മുക്കാൽ. നാളെ രാത്രി പന്ത്രണ്ടരമണി...
4. IPA transliteration/transcription
5. Spell checker
6. Hyphenation
7. Syllabalzer


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
There is another binding which looks recent at
https://github.com/hbuschme/pysfstmorph. Not tried either of them.

Nodejs
------
No known bindings. Worth to write one from scratch?
