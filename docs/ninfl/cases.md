# Cases

case denotes a word's [grammatical case](https://en.wikipedia.org/wiki/Grammatical_case) and its [role](https://en.wikipedia.org/wiki/Grammatical_relation) in a phrase or sentence.

Following are Malayalam cases(വിഭക്തി) for nominal inflection

1. Nominative is associated with the subject of a verb.
2. Accusative (പ്രതിഗ്രാഹിക) indicates the direct object of a transitive verb.
3. Dative (ഉദ്ദേശിക) indicates an indirect object, which refers to the referent receiving the direct object.
4. Sociative
5. Instrumental indicates whether a noun is the instrument by which an action is completed.
6. Genitive indicates possession.
7. Locative (ആധാരിക) indicates a word's use to refer to a location.
8. Vocative indicates a noun being used to address someone or something, usually when spoken to.

## Nominative

## Accusative

The accusative marks the direct object(കർമ്മം) of transitive verbs. Accusative morpheme is -എ.

POS tag: `<accusative>`

::: rule
**Consonant+Anuswara Rule**: If the word ends with Anuswara(ം) and that Anuswaram is just after a **consonant**, then replace anuswara by "ത്തെ" or "ത്തിനെ".
:::

::: example
* `മരം<n><accusative>` ⇒ മരത്തെ or മരത്തിനെ
* `മുറ്റം<n><accusative>` ⇒ മുറ്റത്തെ or മുറ്റത്തിനെ
* `കുറ്റം<n><accusative>` ⇒ കുറ്റത്തെ or കുറ്റത്തിനെ
* `സ്നേഹം<n><accusative>` ⇒ സ്നേഹത്തെ or സ്നേഹത്തിനെ
:::

The abbreviated form ത്തെ is more preferred in this case though.

::: rule
**Vowel+Anuswara Rule**: If the word ends with Anuswara(ം) and that Anuswaram is just after a **vowel**, then replace anuswara by "ഇനെ".
:::

Phonological rules will change this further to ിനെ by changing vowel to vowel sign.

::: example
* `കലാം<n><accusative>` ⇒ കലാമിനെ
* `ബദാം<n><accusative>` ⇒ ബദാമിനെ
* `ടീം<eng><accusative>` ⇒ ടീമിനെ
:::

::: rule
**Chillus or Chandrakkla**: If the word ends with Chillu letters ർ ൻ ൺ ൿ ൽ or Chandrakkla(്), then the inflection is "ഇനെ".
:::

Phonological rules will change this further. Note that here we are excluding ൾ from the set of chillus because that has different rule.

::: example
* `മീൻ<n><accusative>` ⇒ മീനിനെ
* `കാൽ<n><accusative>` ⇒ കാലിനെ
* `ഡോക്ടർ<eng><accusative>` ⇒ ഡോക്ടറിനെ
* `അണ്ണൻ<n><accusative>` ⇒ അണ്ണനെ
* `തൂൺ<n><accusative>` ⇒ തൂണിനെ
:::

::: rule
**Word ending with Consonants, Vowel signs, ൾ, ൻ**: If the word ends with Chillu letters ൾ or ൻ, then add "എ" at the end.
:::

::: example
* `അവൻ<n><accusative>` ⇒ അവനെ
* `മകൾ<n><accusative>` ⇒ മകളെ
* `പൂ<n><plural><accusative>` ⇒ പൂക്കളെ
* `മീൻ<n><accusative>` ⇒ മീനെ
* `ജനം<n><plural><accusative>` ⇒ ജനങ്ങളെ
* `മഴ<n><n><accusative>` ⇒ മഴയെ
* `പൂച്ച<n><n><accusative>` ⇒ പൂച്ചയെ
* `പീലി<n><n><accusative>` ⇒ പീലിയെ
* `തോണി<n><n><accusative>` ⇒ തോണിയെ
:::

Here, മീനെ is not really popular usuage, but not invalid. മീനിനെ is better.

Finally, When the word is a pronoun there are several exceptions.

::: rule
**Pronouns**: For pronouns, special handling required
:::

These rules need to be specified per words there is no common pattern

| Pronoun | Accusative form |
| --- | --- |
| ഞാൻ | എന്നെ |
| താൻ | തന്നെ |
| നാം |  നമ്മെ |
| അവർ | അവരെ |
| ഇവൻ |  ഇവനെ|
| നീ | നിന്നെ|

The order of the rules executed is in the reverse order of listing above. First the pronouns, and last is anuswara forms.

Inanimate nouns are left without any markers for accusative inflection. For example, ഞാൻ **പാട്ട്** പഠിച്ചു, അവൻ **ചായ** കുടിച്ചു. This is not implemented in mlmorph.

## Dative

## Sociative

## Instrumental

## Genitive

## Locative

Locative (ആധാരിക) indicates a word's use to refer to a location. The locative morpheme is -ഇൽ, -കൽ

POS tag: `<locative>`

::: rule
**Words ending with Anuswara** Replace anuswara by any of "ത്തിൽ", "ത്തിങ്കൽ",  "ത്ത്", "ത്തു്", "ത്തു"
:::

Among this, ത്തേൽ is a dialect specific form. മരത്തേൽ instead of മരത്തിൽ is a usage common in places near Kottayam.

ത്തിങ്കൽ is an archaic form found in older Malayalam content like മരത്തിങ്കൽ.

ത്തു് is Samvruthokaram form alternative to ത്ത് form. ത്തു is often for connecting the inflected form to other words in sentence. For example മുറ്റത്തു ഇല വീണു instead of  മുറ്റത്ത് ഇല വീണു.

::: example

* `പാടം<n><locative>` ⇒ പാടത്തിൽ, പാടത്തിങ്കൽ, പാടത്ത്, പാടത്തു, പാടത്തു
* `മരം<n><locative>` ⇒ മരത്തിൽ, മരത്തിങ്കൽ, <s>മരത്ത്</s>, <s>മരത്തു്</s>, <s>മരത്തു</s>

:::

While forms like മരത്ത് is generated as part of this rule, due to familiarity of usage മരത്തിൽ is preferred. Given all variants, picking the right one with more usage is difficult here.

കുളത്തിൽ, കുളത്തേൽ, കുളത്തിങ്കൽ is better than കുളത്ത്. But മുറ്റത്ത് is better than മുറ്റത്തിൽ.

::: rule
**Words ending with Consonant or Vowel sign** Append ഇൽ.
:::

::: example

* `തറ<n><locative>` ⇒ തറയിൽ
* `ഇല<n><locative>` ⇒ ഇലയിൽ
* `വഴി<n><locative>` ⇒ വഴിയിൽ
* `വരി<n><locative>` ⇒ വരിയിൽ
* `ഇന്ത്യ<n><locative>` ⇒ ഇന്ത്യയിൽ

:::

::: rule
**Words ending with Chandrakkala or Chillus** Append ഇൽ, ഇങ്കൽ, അത്ത്, അത്തു, അത്തു്.
:::

::: example

* `കാറ്റ്<n><locative>` ⇒ കാറ്റിൽ, കാറ്റത്ത്, കാറ്റത്തു് , കാറ്റത്തു, <s>കാറ്റിങ്കൽ</s>
* `കാർ<n><locative>` ⇒ കാറിൽ, കാറേൽ
* `മാവ്<n><locative>` ⇒ മാവിൽ, മാവേൽ, മാവിങ്കൽ, <s>മാവത്ത്</s>

:::

::: warning TODO
As we can see, അത്ത് suffixes are not commonly applicable. This need further improvement.
:::

Even though the "location" aspect of locative is part of the definition, that is not always true. For example, in കുട്ടികളിൽ, there is no location. Instead it is used for marking the whole of which a part is taken out. Example: കുട്ടികളിൽ പത്തുശതമാനം, ആളുകളിൽ ഭൂരിപക്ഷവും

Similarly, the objective of comparison in comparative clauses is marked by locative using ഉം particle. Example: കാപ്പിയിലും നല്ലത് ചായയാണ്. അതിലും വലുത് ഇതാണ്.

