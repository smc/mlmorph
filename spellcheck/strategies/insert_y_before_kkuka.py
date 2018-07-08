from .suggestion_strategy import SuggestionStrategy


class Ykkuka(SuggestionStrategy):
    """
    Insert യ് before ക്കുക. Example വക്കുക - വയ്ക്കുക
    """

    def suggest(self, word):
        candidates = []
        candidate = word.replace('ക്കുക', 'യ്ക്കുക')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ക്കൽ', 'യ്ക്കൽ')
        if candidate != word:
            candidates.append(candidate)
        return candidates