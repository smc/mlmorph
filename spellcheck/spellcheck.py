"""
Define a family of algorithms, encapsulate each one, and make them
interchangeable. Strategy lets the algorithm vary independently from
clients that use it.
"""

import abc
import os
import sys
import importlib
os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')
from mlmorph import Mlmorph

morph = Mlmorph('../malayalam.a')


class Suggestion:
    """
    Define the interface of interest to clients.
    Maintain a reference to a Strategy object.
    """

    def __init__(self, strategy):
        self._strategy = strategy

    def suggest(self, word):
        return self._strategy.suggest(word)


def getSuggestions(word):
    STRATEGIES = ['VowelElongation', 'VowelShortening', 'NtaFixes',
                  'ChilluToConsonantVirama', 'ConsonantViramaToChillu', 'MpaFixes']
    suggestions = []
    for i in range(len(STRATEGIES)):
        strategy = getattr(importlib.import_module(
            "strategies"), STRATEGIES[i])()
        context = Suggestion(strategy)
        candidates = context.suggest(word)
        for candidate in candidates:
            spellcheck_result = spellcheck(candidate)
            if spellcheck_result is True:
                suggestions.append(candidate)
    return suggestions


def spellcheck(word):
    analysis = morph.analyse(word)
    if len(analysis) == 0:
        return False
    else:
        return True


def main(word):
    spellcheck_result = spellcheck(word)
    if spellcheck_result is True:
        print('Word %s is spelled correctly' % (word))
    else:
        print('Word %s is spelled incorrectly. Suggestions:' % (word))
        print(getSuggestions(word))


if __name__ == "__main__":
    main('സന്തോഷ്')
    main('കോഴിക്കൊട്')
    main('ഓടിപ്പൊയി')
    main('കാര്ത്തിക')
    main('പംപ')
    main('സെൻറർ')
