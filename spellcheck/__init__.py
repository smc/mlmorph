"""
Define a family of algorithms, encapsulate each one, and make them
interchangeable. Strategy lets the algorithm vary independently from
clients that use it.
"""
from __future__ import absolute_import

import abc
import importlib
from .strategies import *

class Suggestion:
    """
    Define the interface of interest to clients.
    Maintain a reference to a Strategy object.
    """

    def __init__(self, strategy):
        self._strategy = strategy

    def suggest(self, word):
        return self._strategy.suggest(word)


def getSuggestions(word, morph):
    # Order of the items in STRATEGIES is important
    STRATEGIES = ['VisualSimilarity', 'Ykkuka', 'TTaCorrection', 'NtaCorrection', 'MpaCorrection', 'LLaCorrection',
                  'GeminateConsonants', 'ViramaInsertion', 'VowelElongation', 'VowelShortening',
                  'ChilluToConsonantVirama', 'ConsonantViramaToChillu',
                  'ChilluNormalization',
                  'ConsonantAspirationCorrection', 'ConsonantVoiceCorrection']
    suggestions = []
    for i in range(len(STRATEGIES)):
        strategy = globals()[STRATEGIES[i]]()
        context = Suggestion(strategy)
        candidates = context.suggest(word)
        for candidate in candidates:
            if spellcheck(candidate, morph) is True:
                if not candidate in suggestions:
                    suggestions.append(candidate)
    return suggestions


def spellcheck(word, analyser):
    analysis = analyser.analyse(word, False)
    if len(analysis) == 0:
        return False
    else:
        return True

