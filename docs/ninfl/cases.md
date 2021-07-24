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

This is defined by the following verse in [വിഭക്തിപ്രകരണം](https://ml.wikisource.org/wiki/%E0%B4%95%E0%B5%87%E0%B4%B0%E0%B4%B3%E0%B4%AA%E0%B4%BE%E0%B4%A3%E0%B4%BF%E0%B4%A8%E0%B5%80%E0%B4%AF%E0%B4%82/%E0%B4%A8%E0%B4%BE%E0%B4%AE%E0%B4%BE%E0%B4%A7%E0%B4%BF%E0%B4%95%E0%B4%BE%E0%B4%B0%E0%B4%82/%E0%B4%B5%E0%B4%BF%E0%B4%AD%E0%B4%95%E0%B5%8D%E0%B4%A4%E0%B4%BF%E0%B4%AA%E0%B5%8D%E0%B4%B0%E0%B4%95%E0%B4%B0%E0%B4%A3%E0%B4%82) chapter of കേരളപാണിനിയം

```
തന്മ നിർദ്ദേശികാ കർത്താ;
പ്രതിഗ്രാഹിക കർമ്മമെ;
ഓടു് സംയോജികാ സാക്ഷി;
സ്വാമിയുദ്ദേശികാ ,ക്ക്, ഉ്
ആൽ പ്രയോജികയാം ഹേതു;
ഉടെ സംബന്ധികാ സ്വതാ;
ആധാരികാധികരണം
ഇൽ, കൽ പ്രത്യയമായവ.
```

## Nominative

Nominative(നിർദ്ദേശിക) is associated with the subject of a verb. Since the noun appears without any inflection, there is no morpheme for this.

::: warning TODO
Since there is no inflection, mlmorph does not implement or provide a tag for this case. Ideally, all nouns should come with a `<nominative>` tag.
:::

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
| ------- | --------------- |
| ഞാൻ      | എന്നെ             |
| താൻ      | തന്നെ             |
| നാം       | നമ്മെ             |
| അവർ     | അവരെ             |
| ഇവൻ     | ഇവനെ             |
| നീ       | നിന്നെ             |

The order of the rules executed is in the reverse order of listing above. First the pronouns, and last is anuswara forms.

Inanimate nouns are left without any markers for accusative inflection. For example, ഞാൻ **പാട്ട്** പഠിച്ചു, അവൻ **ചായ** കുടിച്ചു. This is not implemented in mlmorph.

## Dative

The dative(ഉദ്ദേശിക) is used for indirect objects. The function is categorized as സ്വാമി/master to denote 'independent'

The morpheme used for Dative inflection is -ക്ക്, ഉ്.

POS tagL `<dative>`

::: rule
**Words ending with Consonant, Vowel signs** : Append ക്ക്, ക്കു, യ്ക്ക്, യ്ക്കു
:::

::: example

* `അമ്മ<n><dative>` ⇒ അമ്മയ്ക്ക്, അമ്മക്ക്, അമ്മയ്ക്കു
* `പുഴ<n><sociative>` ⇒ പുഴക്കു, പുഴയ്ക്ക്, പുഴയ്ക്കു
* `കുട്ടി<n><sociative>` ⇒ കുട്ടിയ്ക്ക്, കുട്ടിക്കു
:::

::: rule
**Words ending with Chandrakkala, ൽ, ൺ** : Append ഇന്, ഇനു്, ഇനു
:::

::: example

* `കാട്<n><dative>` ⇒ കാടിനു, കാടിന്, കാടിനു്
* `കാൽ<n><sociative>` ⇒ കാലിന്, കാലിനു
* `ഫോൺ<eng><sociative>` ⇒ ഫോണിനു, ഫോണിന്
:::


::: rule
**Words ending with ൻ** : Replace ൻ with ന്, നു, നു്
:::

::: example

* `അവൻ<n><dative>` ⇒ അവനു, അവന്, അവനു്
* `വേലക്കാരൻ<n><sociative>` ⇒ വേലക്കാരന്
* `വേടൻ<eng><sociative>` ⇒ വേടന്
:::

::: rule
**Words ending with ർ** : Replace ർ with രിന്, റിന്
:::

::: example

* `കാർ<n><dative>` ⇒ കാറിന്, <s>കാരിന്</s>
* `മലർ<n><dative>` ⇒ മലരിന്, <s>മലറിന്</s>
:::

::: rule
**Words ending with ൾ, ർ** : Append ക്ക്, ക്കു, ക്കു്
:::

::: rule
**Words ending with Anuswara** : Replace Anuswara by ത്തിന്, ത്തിനു, ത്തിനു്
:::

::: example

* `പാലം<n><dative>` ⇒ പാലത്തിന്
* `നിയമം<n><dative>` ⇒ നിയമത്തിനു, നിയമത്തിനു്, നിയമത്തിന്
:::

::: rule
**Special forms for pronouns** : Replace Anuswara by ത്തിന്, ത്തിനു, ത്തിനു്
:::

| Pronoun | Dative form |
| ------- | ------------- |
| ഞാൻ      | എനിക്ക്, എനിയ്ക്ക്, എനിക്കു, എനിക്കു്  |
| അവർ     | അവർക്ക്, അവർക്കു്, അവർക്കു   |
| നീ       | നിനക്ക്, നിനക്കു്, നിനക്കു  |
| താൻ      | തനിയ്ക്ക്, തനിയ്ക്കു,    തനിക്കു   |
| നാം       | നമുക്ക്, നമുക്കു്, നമുക്കു  |


## Sociative

The sociative(സംയോജിക) -ഓട് marks the indirect object of verbs that require company/witness(സാക്ഷി)

Typically, the sociative marker marks :

* the addressee of speech
* the object of association and connection
* of emotions like anger

POS tag: `<sociative>`

::: rule
**Words ending with Consonant, Chillu, Virama, Vowel signs, Chandrakkala** : Append ഓട്, ഓടു, ഓടു്
:::

::: example

* `അമ്മ<n><sociative>` ⇒ അമ്മയോട്
* `പുഴ<n><sociative>` ⇒ പുഴയോട്
* `കാറ്റ്<n><sociative>` ⇒ കാറ്റോട്
* `അവൻ<prn><sociative>` ⇒ അവനോട്
:::

Then there is an additional form for words ending with Chandrakkala

::: rule
**Words ending with Chandrakkala** : Append ഇനോട്.
:::

::: example

* `പൂവ്<n><sociative>` ⇒ പൂവിനോട്
* `കാട്<n><sociative>` ⇒ കാടിനോട്
* `നാട്<n><sociative>` ⇒ നാടിനോട്
:::

::: rule
**Words ending with Anuswaram** : Replace anuswaram by ത്തിനോട് or ത്തോട്.
:::

::: example

* `നിറം<n><sociative>` ⇒ നിറത്തോട്, നിറത്തിനോട്, നിറത്തോടു
* `പാലം<n><sociative>` ⇒ പാലത്തിനോട്, പാലത്തോട്, പാലത്തോടു
:::

## Instrumental

Instrumental(പ്രയോജിക) indicates whether a noun is the instrument by which an action is completed.

::: rule
Append -ആൽ, -കൊണ്ട് are two morphemes used to mark instrumental inflection.
:::

The adverbial phrase compunded of the marker -എ is also used with കൊണ്ട്.

POS tag: `<instrumental>`

::: example

* `വടി<n><sociative>` ⇒ വടിയാൽ, വടികൊണ്ട്, വടികൊണ്ടു, വടികൊണ്ടു്, വടിയെക്കൊണ്ട്, വടിയെക്കൊണ്ടു, വടിയെക്കൊണ്ടു്
* `മഴ<n><instrumental>` ⇒ പാലത്തിനോട്, പാലത്തോട്, പാലത്തോടു
:::

## Genitive

The genitive(സംബന്ധിക) marks the owner in possessive phrases. The genitive morphemes are -ഉടെ and -ന്റെ

POS tag: `<genitive>`

::: rule
**Words ending with Consonant or Vowel signs of ആ, ഇ, ഈ, എ, ഏ, ഒ, ഓ** : Append ഉടെ.
:::

::: example

* `അമ്മ<n><genitive>` ⇒ അമ്മയുടെ
* `പുലി<n><genitive>` ⇒ പുലിയുടെ
* `അമ്മു<n><genitive>` ⇒ അമ്മുവിന്റെ
* `മാവോ<n><genitive>` ⇒ മാവോയുടെ
:::

::: rule
**Words ending with Chandrakkala or Vowel signs of ഉ, ഔ** : Append ഇന്റെ.
:::

::: example

* `അമ്മു<n><genitive>` ⇒ അമ്മുവിന്റെ
* `പശു<n><genitive>` ⇒ പശുവിന്റെ
* `കാട്<n><genitive>` ⇒ കാടിന്റെ
:::

::: rule
**Words ending with Anuswara after a consonant** : Append ത്തിന്റെ or ത്തിൻ.
:::

::: example

* `പൂരം<n><genitive>` ⇒ പൂരത്തിന്റെ, പൂരത്തിൻ
* `കാലം<n><genitive>` ⇒ കാലത്തിന്റെ, കാലത്തിൻ
* `കേരളം<n><genitive>` ⇒ കേരളത്തിന്റെ

:::

::: rule
**Words ending with Anuswara after a vowel sign** : Append ഇന്റെ or ഇൻ.
:::

::: example

* `ഐസ്ക്രീം<eng><genitive>` ⇒ ഐസ്ക്രീമിന്റെ, ഐസ്ക്രീമിൻ
* `സലിം<n><genitive>` ⇒ സലിമിന്റെ, സലിമിൻ
* `റൂം<eng><genitive>` ⇒ റൂമിന്റെ, റൂമിൻ

:::

::: rule
**Words ending with ൻ**: Replace ൻ with ന്റെ or ഉടെ.
:::

::: example

* `നടൻ<n><genitive>` ⇒ നടന്റെ, നടനുടെ
* `ഭടൻ<n><genitive>` ⇒ ഭടന്റെ, ഭടനുടെ

:::

::: warning TODO
Some English originated words like ഫാൻ, പെൻ does not become ഫാന്റെ, പെന്റെ. They are ഫാനിന്റെ, പെന്നിന്റെ. This is not handled yet.
:::

::: rule
**Words ending with ർ**: Replace ർ with രിന്റെ or റിന്റെ
:::

::: example

* `കാർ<n><genitive>` ⇒ കാറിന്റെ
* `പയർ<n><genitive>` ⇒ പയറിന്റെ

:::

::: rule
**Words ending with Chillus**: Replace Chillu with ഇന്റെ or ഉടെ
:::

::: example

* `ഫോൺ<eng><genitive>` ⇒ ഫോണിന്റെ, <s>ഫോണുടെ</s>
* `തൃശ്ശൂർ<n><genitive>` ⇒ തൃശ്ശൂരിന്റെ
* `പൂ<n><plural><genitive>` ⇒ പൂക്കളുടെ, <s>പൂക്കളിന്റെ</s>
* `മീൻ<n><genitive>` ⇒ മീനിന്റെ, <s>മീനുടെ</s>

:::

::: rule
**Words ending with Chillus or Consonants - Poetic form**: Append തൻ
:::

Examples: രാധതൻ, കുമാരിതൻ, പൂച്ചതൻ, മീശതൻ, കുട്ടിതൻ, മഴതൻ, വിധിതൻ

::: rule
**Pronouns**: Pronouns has special cases for genitve inflection and in mlmorph they are handled by an exception dictionary
:::

| Pronoun | Genitive form |
| ------- | ------------- |
| ഞാൻ      | എന്റെ, എന്നുടെ     |
| അവർ     | അവരുടെ, അവർതൻ   |
| നീ       | നിന്റെ, നിന്നുടെ     |
| താൻ      | തന്റെ, തന്റെ      |
| നാം       | നമ്മുടെ, നമ്മളുടെ   |

## Locative

Locative (ആധാരിക) indicates a word's use to refer to a location. The locative morpheme is -ഇൽ, -കൽ

POS tag: `<locative>`

::: rule
**Words ending with Anuswara** Replace anuswara by any of "ത്തിൽ", "ത്തിങ്കൽ", "ത്ത്", "ത്തു്", "ത്തു"
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

## Vocative

POS tag: `<vocative>`

The vocative marks the addressee(സംബോധിക) of a statement or invocation. Vocative marker changes according to the phoneme at the end of the word.

| End of word | Vocative inflection | Example |
| ----------------------- | ------------ | ---- |
| Consonants | Append ഏ | അമ്മ ⇒ അമ്മേ |
| Virama | Append ഏ | സാറ് ⇒ സാറേ, കാറ് ⇒  കാറേ , തൂണ് ⇒  തൂണേ  |
| Chillu | Append ഏ | മകൾ ⇒ മകളേ, മകൻ  ⇒ മകനേ |
| ു, ൂ  | Append വേ | മുത്തു  ⇒  മുത്തുവേ |
|  ി , ീ  | Append യേ | കിളി ⇒ കിളിയേ |
| Anuswaram ം | Append ഏ | തങ്കം  ⇒ തങ്കമേ |
|  ൻ | Replace by ാ | ശിവൻ  ⇒ ശിവാ, വേടൻ ⇒ വേടാ, ഈശ്വരൻ  ⇒ ഈശ്വരാ |

## Allative

Allative case adds a meaning of destination. Example: ഞങ്ങൾ **മുറിയിലേയ്ക്ക്** പോകുന്നു.

POS tag: `<allative>`

::: rule
**Words ending with Anuswara** Replace anuswara by any of "ത്തിലേയ്ക്ക്", "ത്തിലേയ്ക്കു", "ത്തേലേയ്ക്ക്", "ത്തേലേക്ക്", "ത്തിങ്കലേയ്ക്ക്", ത്തേയ്ക്ക്, ത്തേക്ക്, ത്തേയ്ക്കു, ത്തിലോട്ട്, ത്തിലോട്ടു, ത്തേലോട്ട്, ത്തിങ്കലോട്ട്, ത്തോട്ടു,  ത്തോട്ട്, ത്തോട്ടു്
:::


::: example

* `പാടം<n><allative>` ⇒ പാടത്തിലേയ്ക്ക്, പാടത്തോട്ട്, പടത്തോട്ടു, പാടത്തേലേയ്ക്ക് etc
* `മരം<n><allative>` ⇒ മരത്തേലേക്ക്, മരത്തിലോട്ട് etc
:::

::: rule
**Words ending with Consonant or Vowel sign** Append ഇലേയ്ക്ക്, ഇലേക്ക്, ഇലോട്ട്
:::

::: example

* `തറ<n><allative>` ⇒ തറയിലേക്ക്, തറയിലോട്ട്
* `ഇല<n><allative>` ⇒ ഇലയിലേയ്ക്ക്, ഇലയിലേക്കു, ഇലയിലോട്ട്
* `വഴി<n><allative>` ⇒ വഴിയിലേക്ക്, വഴിയിലോട്ട്
* `വരി<n><allative>` ⇒ വരിയിലേയ്ക്ക്, വരിയിലോട്ടു
* `ഇന്ത്യ<n><allative>` ⇒ ഇന്ത്യയിലോട്ട്, ഇന്ത്യയിലേയ്ക്കു

:::

::: rule
**Words ending with Chandrakkala or Chillus** Append ഇലേയ്ക്ക്, ഇങ്കലേയ്ക്ക്, ഏലേക്ക്, ഇലോട്ട്, ഇലോട്ടു, ഏലോട്ട്, ഇങ്കലോട്ട്, അത്തോട്ട്
:::

::: example

* `കാറ്റ്<n><allative>` ⇒ കാറ്റിലേക്ക്, കാറ്റത്തോട്ട്, കാറ്റേലേക്ക്
* `കാർ<n><allative>` ⇒ കാറിലേക്ക്, കാറിലോട്ടു, കാറേലേക്ക്
* `മാവ്<n><allative>` ⇒ മാവേലേക്ക്, മാവിലേക്ക്, മാവിലോട്ട്

:::

::: rule
**Words ending with ട്** Geminate ട(ട്ട) Append ഇലേയ്ക്ക്, ഇങ്കലേയ്ക്ക്,  ഇലോട്ട്, ഇലോട്ടു, ഇങ്കലോട്ട്, അത്തോട്ട്
:::

::: example

* `വീട്<n><allative>` ⇒ വീട്ടിലേയ്ക്ക്, വീട്ടിലോട്ട്, വീട്ടിലേക്കു, വീട്ടിലോട്ടു
* `കാട്<n><allative>` ⇒ കാട്ടിലേക്ക്, കാട്ടിലോട്ട്, കാട്ടിലേക്കു, കാട്ടിലോട്ടു
:::

In most instances -ഏക്ക് and -ഓട്ട് are in free variation. However, when a variety of instances are analyzed there seems to be a subtle variation in the meaning between these two forms. ഏക്ക് denotes a specific direction and ഓട്ടി  a general direction as can be seen in the following example.

::: example

* കുഴിയിലേക്ക് - In to the hole
* കുഴിയിലോട്ട് - Towards the hole
:::

::: warning TODO
The locative particles അങ്ങ്, ഇങ്ങ്, മുൻ, പിൻ takes ഓട്ടു form without locative suffix ഇൽ to denote allative meaning. Examples: അങ്ങോട്ട്, ഇങ്ങോട്ട്,പിന്നോട്ട്, മുന്നോട്ട്, പിന്നിലേക്ക്, മുന്നിലേക്ക്
:::

## Perlative

Allative case adds a meaning of path of movement.

POS tag: `<perlative>`

::: rule
**Words ending with Anuswara** Replace anuswara by any of ത്തിലൂടെ, ത്തിൽക്കൂടെ
:::


::: example

* `പാടം<n><perlative>` ⇒ പാടത്തിലൂടെ, പാടത്തിൽക്കൂടെ
* `മരം<n><perlative>` ⇒ മരത്തിലൂടെ, മരത്തിൽക്കൂടെ
:::

::: rule
**Words ending with Consonant or Vowel sign** Append ഇലൂടെ, ഇൽക്കൂടെ
:::

::: example

* `തറ<n><perlative>` ⇒ തറയിലേക്ക്, തറയിലോട്ട്
* `ഇല<n><perlative>` ⇒ ഇലയിലേയ്ക്ക്, ഇലയിലേക്കു, ഇലയിലോട്ട്
* `വഴി<n><perlative>` ⇒ വഴിയിലേക്ക്, വഴിയിലോട്ട്
* `വരി<n><perlative>` ⇒ വരിയിലേയ്ക്ക്, വരിയിലോട്ടു
* `ഇന്ത്യ<n><perlative>` ⇒ ഇന്ത്യയിലോട്ട്, ഇന്ത്യയിലേയ്ക്കു

:::

::: rule
**Words ending with Chandrakkala or Chillus** Append ഇലൂടെ, ഇൽക്കൂടെ
:::

::: example

* `കാറ്റ്<n><perlative>` ⇒ കാറ്റിലൂടെ, കാറ്റിൽക്കൂടെ

:::

::: rule
**Words ending with ട്** Geminate ട(ട്ട) Append ഇലൂടെ, ഇൽക്കൂടെ
:::

::: example


* `വീട്<n><perlative>` ⇒ വീട്ടിലൂടെ
* `കാട്<n><perlative>` ⇒ കാട്ടിലൂടെ
:::

## Ablative

Ablative case adds a meaning of source. Example: ഞങ്ങൾ **വീട്ടിൽനിന്നു** പോന്നു.

POS tag: `<ablative>`

::: rule
**Words ending with Anuswara** Replace anuswara by any of ത്തിൽനിന്ന്, ത്തിൽനിന്നു
:::


::: example

* `പാടം<n><ablative>` ⇒ പാടത്തിൽനിന്ന്, പാടത്തിൽനിന്നു
* `മരം<n><ablative>` ⇒ മരത്തിൽനിന്ന്, മരത്തിൽനിന്നു
:::

::: rule
**Words ending with Consonant or Vowel sign** Append ഇൽനിന്ന്, ഇൽനിന്നു
:::

::: example

* `തറ<n><ablative>` ⇒ തറയിൽനിന്ന്, തറയിൽനിന്നു
* `ഇല<n><ablative>` ⇒ ഇലയിൽനിന്ന്
* `വഴി<n><ablative>` ⇒ വഴിയിൽനിന്ന്
* `വരി<n><ablative>` ⇒ വരിയിൽനിന്ന്
* `ഇന്ത്യ<n><ablative>` ⇒ ഇന്ത്യയിൽനിന്ന്

:::

::: rule
**Words ending with Chandrakkala or Chillus** Append ഇലൂടെ, ഇൽക്കൂടെ
:::

::: example

* `കാറ്റ്<n><ablative>` ⇒ കാറ്റിൽനിന്ന്

:::

::: rule
**Words ending with ട്** Geminate ട(ട്ട) Append ഇലൂടെ, ഇൽക്കൂടെ
:::

::: example


* `വീട്<n><ablative>` ⇒ വീട്ടിൽനിന്ന്
* `കാട്<n><ablative>` ⇒ കാട്ടിൽനിന്ന്

:::