from .suggestion_strategy import SuggestionStrategy


class LLaCorrection(SuggestionStrategy):
    """
    Replace ള്ള with ള്ള
    """

    def suggest(self, word):
        candidates = []
        candidate = word.replace('ളള', 'ള്ള')
        if candidate != word:
            candidates.append(candidate)

        return candidates