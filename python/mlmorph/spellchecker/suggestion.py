class Suggestion:
    """
    Define the interface of interest to clients.
    Maintain a reference to a Strategy object.
    """

    def __init__(self, strategy):
        self._strategy = strategy

    def suggest(self, word):
        return self._strategy.suggest(word)
