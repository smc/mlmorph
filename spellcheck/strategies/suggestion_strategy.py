import abc
import re


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
        return re.compile(r'([ക-ഹ])').search(char) != None
