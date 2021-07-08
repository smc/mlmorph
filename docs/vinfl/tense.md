# Tense

[Tense](https | //en.wikipedia.org/wiki/Grammatical_tense) is the verb's reference to a position in time.

## Past tense

The past tense of a verb has some patterns of inflection, but we will need to maintain a suffix mapping dictionary and an exception dictionary.

POS Tag: `<past>`

mlmorph has an exception dictionary for past tense of verbs. This is a mapping between a word in citation form(നടുവിനയെച്ചം -ഉക forms) and their past tenses literally written down. Som examples from this is given below

| Verb | Past tense |
| ---- | ----- |
| ഓടുക | ഓടി |
| ആടുക | ആടി |
| ഇടുക | ഇട്ടു |
| ചാവുക | ചത്തു |
| ഉണ്ണുക | ഉണ്ടു |
| ആയുക | ആഞ്ഞു |
| തികയുക | തികഞ്ഞു |
| ആഴുക | ആണ്ടു |
| തൊഴുക | തൊഴുതു |
| പോവുക | പോയി |
| പണിയുക | പണിഞ്ഞു, പണിതു |
| വരിക, വരുക | വന്നു |
| തരിക,തരുക | തന്നു |
| പോകുക | പോയി |
| ആവുക, ആകുക | ആയി |
| ആക്കുക | ആക്കി |
| കൂവുക | കൂവി |
| കൂകുക | കൂകി |
| ഇരിക്കുക | ഇരുന്നു |
| കാക്കുക | കാത്തു |
| കോരുക | കോരി |
| കാണുക | കണ്ടു |
| കക്കുക | കട്ടു |
| കിടക്കുക | കിടന്നു |
| നിൽക്കുക | നിന്നു |
| നില്ക്കുക | നിന്നു |
| നടക്കുക | നടന്നു |
| കടക്കുക | കടന്നു |
| പരക്കുക | പരന്നു |
| തോൽക്കുക | തോറ്റു |
| നോവുക | നൊന്തു |
| കൊള്ളുക | കൊണ്ടു |
| തിന്നുക | തിന്നു |
| ചുമക്കുക | ചെമന്നു |
| ചുവക്കുക | ചുവന്നു |
| വിശക്കുക | വിശന്നു |
| അളക്കുക | അളന്നു |
| നീളുക | നീണ്ടു |
| കൊല്ലുക | കൊന്നു |
| തല്ലുക | തല്ലി |
| തല്ലുക | തച്ചു |
| ചൊല്ലുക | ചൊല്ലി |
| ചൊല്ലുക | ചൊന്നു |
| ചെല്ലുക | ചെന്നു |
| വെല്ലുക | വെന്നു |
| ഒക്കുക | ഒത്തു |
| മറക്കുക | മറന്നു |
| ളകുക | ളകി |
| ഉരുളുക | ഉരുണ്ടു |
| കുറുകുക | കുറുകു |
| തുറക്കുക | തുറന്നു |
| വീഴുക | വീണു |
| താഴുക | താണു, താഴ്ന്നു |
| കേഴുക | കേണു |
| എഴുന്നേൽക്കുക | എഴുന്നേറ്റു, എണീറ്റു |

In addition to this, a suffix map is also prepared. The verb forms having the suffixes in this mapping will use the past tense suffixes. Some examples:

| suffix | Past tense suffix |
| --- | ---- |
| ങ്ങുക | ങ്ങി |
| ഞ്ഞുക | ഞ്ഞി |
| ട്ടുക  | ട്ടി |
| ിടുക  |  ിട്ടു |
| ാടുക | ാടി |

So, ചാടുക will become ചാടി, കലങ്ങുക becomes കലങ്ങി by using this table.

The above two tables should take care of irregularity in past tense forms. After this, we will use some inflection rules as given below.

::: rule
**Verbs ending with -ിക്കുക**: Replace `ക്കുക` with `ച്ചു`
:::

::: example

* പറിക്കുക - പറിച്ചു
* പഠിക്കുക - പഠിച്ചു
* ചെരിക്കുക - ചെരിച്ചു
* മുറിക്കുക - മുറിച്ചു
:::

::: rule
**Verbs ending with -ുക്കുക**: Replace `ക്കുക` with `ത്തു`
:::

::: example

* അടുക്കുക - അടുത്തു
* കൊടുക്കുക- കൊടുത്തു
:::

::: rule
**Verbs ending with [എ, ഏ, ഒ, ഓ, ഊ ]ചിഹ്നം+ ക്കുക**: Replace `ക്കുക` with `ക്കി`
:::

::: example

* നോക്കുക- നോക്കി
* പൊക്കുക - പൊക്കി
* ഉടക്കുക - ഉടക്കി
* കറക്കുക - കറക്കി
* തൂക്കുക - തൂക്കി
* കൊടുക്കുക - കൊടുത്തു
:::


## Present tense

Present tense in Malayalam has very regular forms.

POS Tag: `<present>`

::: rule
**Replace ഉക by ഉന്നു**
:::

::: example

* അടിക്കുക - അടിക്കുന്നു
* കരയുക - കരയുന്നു.
* ഓടുക - ഓടുന്നു
* ചിരിക്കുക - ചിരിക്കുന്നു
:::

## Future tense

POS Tag: `<future>`

Future tense in Malayalam has very regular forms.


::: rule
**Replace ഉക by ഉം**
:::

::: example

* അടിക്കുക - അടിക്കും
* കരയുക - കരയും.
* ഓടുക - ഓടും
* ചിരിക്കുക - ചിരിക്കും
:::
