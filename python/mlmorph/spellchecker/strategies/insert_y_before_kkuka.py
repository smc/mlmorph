from .suggestion_strategy import SuggestionStrategy


class Ykkuka(SuggestionStrategy):
    """
    Insert യ് before ക്കുക. Example വക്കുക - വയ്ക്കുക
    """

    def suggest(self, word):
        candidate = word.replace('ക്കുക', 'യ്ക്കുക')
        if candidate != word:
            yield candidate
        candidate = word.replace('ക്കൽ', 'യ്ക്കൽ')
        if candidate != word:
           yield candidate
