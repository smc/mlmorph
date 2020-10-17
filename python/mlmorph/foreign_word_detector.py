#!/usr/bin/env python

import re

ENGLISH_PATTERNS = [
    "ക്സ",
    "ക്ച",
    "സ്ബ",
    "ബ്സ",
    "ിങ്ങ്$",
    "ിങ്$",
    "ിംഗ്$",
    "േഷൻ",
    "ിഷൻ",
    "ോഷൻ",
    "ന്റ്സ്",
    "ഗ്രഫി",
    "^റ്റൈ",
    "ഴ്സ",
    "ൽസ്",
    "ൻസ്",
    "ങ്സ്",
    "യിറ്റ്",
    "യ്സ",
    "യ്റ്റ്",
    "ിസം$",
    "സിസ്",
    "യ്സ്",
    "സ്റ്റ",
    "ന്റ്$",
    "ന്റം",
    "ൻഡ",
    "^റോ",
    "ലീസ്",
    "ഡ്മ",
    "ന്റിക്",
    "ക്റ്റ്",
    "ളജി",
    "ഡ്$",
    "ട്ര",
    "^ഫാ",
    "ഫ്ര",
    "^ഫെ",
    "^ഫി",
    "^ഫീ",
    "^ഫു",
    "^ഫെ",
    "^ഫൊ",
    "^ഫോ",
    "^ഫൈ",
    "^ജെ",
    "^റ",
    "^ഴ",
    "^ട",
    "^ഡ",
    "^ള",
    "^ഹ്യ",
    "^ഹാ",
    "^ഹെ",
    "^ഹോ",
    "^ഹൊ",
    "^ഹൗ",
    "^ഹി",
    "^ഹ്വ",
    "ഗ്രഫ",
    "ലിറ്റി",
    "സിറ്റി",
    "സ്പ്ല",
    "സ്പ്ള",
    "ബിൾ",
    "ബിർ",
    "ബിൻ",
    "ബിൽ",
    "^ബാറ്റ്",
    "ബിറ്റ്",
    "ബെർ",
    "ബ്ല",
    "^ബെ",
    "ബൈ",
    "ബ്ള",
    "ഷിസ്",
    "^ബാൻ",
    "ഡ്ക",
    "ക്യൂ",
    "ജ്യൂ",
    "ജ്യു",
    "ീസ്$",
    "ർട",
    "റ്റിക്$",
    "റ്റിക്കലി$",
    "ിംസ്",
    "യ്ൻ",
    "\\S+[അ-ഔ]\\S+",
]

compiled_english_pattern_regex = re.compile("|".join(ENGLISH_PATTERNS))


def check_foreign_word(word):
    """
    Check if the word is foreign word or not

    Args
    ----
        word : str, word to check whether it is foreign word or not

    Returns
    -------
        int : A score between 0 and 1
    """
    word = word.strip()
    if not is_valid_malayalam_word(word):
        # Unknown word. Surely foreign
        return 1
    if has_sure_patterns(word):
        return 1
    return 0


def has_sure_patterns(word):
    return re.search(compiled_english_pattern_regex, word)


def is_valid_malayalam_word(word):
    if len(word) <= 1:
        return False
    # Ignore all non-Malayalam words
    if re.search(r"[\u0D00-\u0D7F\u200C-\u200D]+", word) is None:
        return False
    return True
