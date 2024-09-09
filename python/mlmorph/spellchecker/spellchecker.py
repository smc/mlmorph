"""
Define a family of algorithms, encapsulate each one, and make them
interchangeable. Strategy lets the algorithm vary independently from
clients that use it.
"""

from __future__ import absolute_import

import importlib

from mlmorph import Analyser

from .suggestion import Suggestion
from .utils import read_common_mistakes


class SpellChecker(object):
    """
    The SpellChecker class implements a spelling specker based on Malayalam
    morphology analyser(mlmorph)
    """

    def __init__(self):
        self.analyser = Analyser()
        self.common_mistakes = read_common_mistakes()

    def strategies(self):
        return [
            "ChilluNormalization",
            "Ykkuka",
            "NtaCorrection",
            "MpaCorrection",
            "VisualSimilarity",
            "PhoneticSimilarity",
            "GeminateConsonants",
            "ViramaInsertion",
            "VowelElongation",
            "VowelShortening",
            "ChilluToConsonantVirama",
            "ConsonantViramaToChillu",
        ]

    def candidates_from_strategies(self, word: str) -> list:
        """
        Generate possible spelling corrections for the provided word using different strategies

        Args:
            word (str): The word for which to calculate candidate spellings
        Returns:
            list: The list of words that are possible candidates. \
                The list is sorted in descending order of candidate scrores. \
                Best candidates are the first candidates in the list.
        """
        # Order of the items in STRATEGIES is important
        STRATEGIES = self.strategies()

        weighted_suggestions = {}
        for class_name in STRATEGIES:
            strategy = getattr(
                importlib.import_module("mlmorph.spellchecker.strategies"), class_name
            )()
            candidates = Suggestion(strategy).suggest(word)
            for candidate in candidates:
                if candidate in weighted_suggestions:
                    continue
                weighted_analysis = self.analyser.analyse(candidate, True, False)
                if len(weighted_analysis) > 0:
                    weighted_suggestions[candidate] = weighted_analysis[0][1]

        # Sort by the increasing order of weights
        suggestions = sorted(weighted_suggestions.items(), key=lambda t: t[1])
        if len(suggestions) == 0:
            # No suggestions. Try splitting the word after 3rd letter
            for index in range(3, len(word) - 3):
                lWord = word[:index]
                rWord = word[index:]
                lAnalysis = self.analyser.analyse(lWord, False)
                rAnalysis = self.analyser.analyse(rWord, False)
                if len(lAnalysis) > 0 and len(rAnalysis) > 0:
                    suggestions.append([lWord + " " + rWord])
                    break
        # Return the words array
        return [suggestion[0] for suggestion in suggestions]

    def is_known_to_analyser(self, word: str) -> bool:
        """
        Check if the given word is known for the mlmorph analyser

        Args:
            word (str): The word for which to calculate candidate spellings
        Returns:
            boolean: Whether the word is known
        """
        analysis = self.analyser.analyse(word, False, True)
        return len(analysis) > 0

    def is_common_mistake(self, word: str) -> bool:
        """
        Check if the given word is a commonly mistaken word based on our
        database of such words

        Args:
            word (str): The word for which to calculate candidate spellings
        Returns:
            boolean: Whether the word is known
        """

        return word in self.common_mistakes

    def spellcheck(self, word: str) -> bool:
        """
        Spellcheck the given word
        Args:
            word (str): The word to spell check
        Returns:
            boolean: True if words is spelled correctly. False, otherwise.
        """
        common_mistake = self.is_common_mistake(word)
        if common_mistake:
            return False
        return self.is_known_to_analyser(word)

    def candidates(self, word: str) -> list:
        """
        Generate possible spelling corrections for the provided word

        Args:
            word (str): The word for which to calculate candidate spellings
        Returns:
            list: The list of words that are possible candidates. \
                The list is sorted in descending order of candidate scrores.\
                Best candidates are the first candidates in the list
        """
        if self.spellcheck(word):
            # Word is spelled correctly
            return []
        common_mistake = self.is_common_mistake(word)
        if common_mistake:
            return [self.common_mistakes.get(word)]
        return self.candidates_from_strategies(word)


__all__ = [SpellChecker]
