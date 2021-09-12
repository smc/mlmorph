# Phonology

The phonological transducer applies the composition of phonological rules on the results of Morphology composition steps. The changes are mainly based on the last letter of first joining morpheme and first letter of second morpheme.

## Chillu normalization

In Malayalam Chillus are atomically encoded. But phonetic transformation of these chillus require converting them to base consonant forms first. So, before passing the text through the phonetic transformation steps every chillu is converted to base consonant + virama form.

This normalization need to be done only if the next letter in text is a vowel or vowel sign.

| Chillu | Normalized form |
|--|----|
| ൿ| ക് |
| ൽ| ല് |
| ൾ| ള് |
| ർ| ര് |
| ർ| റ് |
|ൻ| ന് |
| ൺ| ണ് |
|  ം|മ് |


## Vowel sign - Consonant

Vowel sign followed by hard consonants get geminated, only when the second word is a Malayalam word.

Hard consonants are one of കുചടതപശ

::: example

* അടി + പരപ്പ് => അടിപ്പരപ്പ്
* നൂറ്റി + പത്ത് => നൂറ്റിപ്പത്ത്
* അമ്മി + കല്ല് => അമ്മിക്കല്ല്
* സൂചി + തുള => സൂചിത്തുള
* ആന + വണ്ടി  => ആന്വണ്ടി since വ is not hard consonant
:::

When noun is inflected and compound with a verb, duplication can happen.
Example: കവിതയെക്കുറിക്കുക, but not when ചിരികണ്ടാൽ or തെറിപറഞ്ഞു

## Consonant - Consonant

Consonant followed by hard consonants get duplicated, only when the second word is a Malayalam word.

::: example
* തല + കുറി = തലക്കുറി
* ഓല + പീപ്പി=ഓലപ്പീപ്പി
* ചാണക+പച്ച = ചാണകപ്പച്ച

:::
## Chillu - Consonant

Chillu followed by hard consonants(കുചടതപശ) get duplicated

::: example
* ആൽ + തറ = ആൽത്തറ
* ആൽ + മരം = ആൽമരം since മ is not hard consonant

:::

## Consonant - Vowel

Insert യ between a Consonant and vowel. Only if the second word is Malayalam and not sanskrit.

::: example
* പച്ച + ഇല = പച്ചയില

:::

Repeated use of യ is not ideal like പുതിയയൊരു. In such cases, remove extra ya if it is followed by another യ

::: example
* പുതിയയൊരു = പുതിയൊരു

:::

There are common contractions like ഇല്ല + എങ്കിൽ  => ഇല്ലയെങ്കിൽ => ഇല്ലെങ്കിൽ.

We mentioned that the above rules are not applicable if second word is Sanskrit. For example നത + അംഗി = നതയംഗി is wrong. Instead it is നതാംഗി. For sanskrit a different rule applies.

If the second word is sanskrit and starts with അ, replace it with ആ.


::: example
* നത + അംഗി = നതാംഗി

:::

## Vowel sign - Vowel

Insert യ if first word ends with ാ  ീ  െ  ി എ  ോ  ൈ and Second words starts with a Vowel.

::: example
* അരി + ഇല്ല = അരിയില്ല
* ലിജോ + ഉണ്ട് = ലിജോയുണ്ട്
* തീരെ + ഇല്ല = തീരെയില്ല
* പിടി + ആന = പിടിയാന
:::

There is a special case for പോയി.  പോയി+ ഇല്ല/ഇരുന്നു/ഇരിക്കുക -> പോയില്ല/പോയിരുന്നു.. along with പോയിയില്ല...

Insert വ if first word ends with ു or ൂ and Second words starts with a Vowel.

::: example

* വന്നു + അല്ലേ = വന്നുവല്ലേ
* നടു + ഇൽ = നടുവിൽ
:::

Sometimes the u -sign get deleted if followed by vowel. വന്നു+ ഇല്ല = വന്നില്ല, വന്നെങ്കിൽ, ചെയ്തില്ല. But not അണു+ഇന്റെ !== അണിന്റെ

## Chandrakkala - Vowel

Virama get deleted if followed by a vowel

::: example

* ആട് + അല്ല => ആടല്ല
* പൂവ് + അമ്പലം => പൂവമ്പലം
:::

Samvruthokaram also get deleted if followed by a vowel


## Chandrakkala - Consonant

Virama get replaced by ു sign if followed by consonant

::: example

* വിത്ത് + ഗുണം => വിത്തുഗുണം
* പാട്ട് + പെട്ടി => പാട്ടുപെട്ടി
:::

If the first word has ട് as ending it becomes ട്ടു. Examples: നാട്ടുവെളിച്ചം, കൂട്ടൂപക്ഷി, വീട്ടുമൃഗം, മാട്ടുപ്പൊങ്കൽ

## Vowel to Vowel sign conversion

Since Vowels can only appear at beginning of word, any vowels at the word boundaries get converted to vowel signs. Since അ has no sign, അ get deleted.

## Verb negation

## Exceptions
