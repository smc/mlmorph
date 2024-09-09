import abc
import re
from itertools import product


class SuggestionStrategy(metaclass=abc.ABCMeta):
    """
    Declare an interface common to all supported algorithms. Context
    uses this interface to call the algorithm defined by a
    ConcreteStrategy.
    """

    @abc.abstractmethod
    def suggest(self):
        pass

    def isConsonant(self, char):
        return re.compile(r"([ക-ഹ])").search(char) is not None

    def getCandidatesWithReplacements(self, word, letters):
        origLetterList = list(word)
        for replacement, pos in product(letters, range(len(word))):
            original = origLetterList[pos]
            if original in letters:
                origLetterList[pos] = replacement
                yield "".join(origLetterList)
