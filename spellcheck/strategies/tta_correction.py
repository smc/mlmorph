from .suggestion_strategy import SuggestionStrategy


class TTaCorrection(SuggestionStrategy):
    """
    ററ -> റ്റ   - tta correction
    """

    def suggest(self, word):
        candidates = []
        candidate = word.replace('ററ', 'റ്റ')
        if candidate != word:
            candidates.append(candidate)
        return candidates