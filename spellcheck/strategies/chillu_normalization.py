from .suggestion_strategy import SuggestionStrategy


class ChilluNormalization(SuggestionStrategy):
    """
    Normalize to atomic chillu - Replace any non-atomic chillu to atomic chillu
    """

    def suggest(self, word):
        candidates = []
        candidate = word.replace('ന്\u200D', 'ൻ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ര്\u200D', 'ർ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ല്\u200D', 'ൽ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ണ്\u200D', 'ൺ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ള്\u200D', 'ൾ')
        if candidate != word:
            candidates.append(candidate)
        return candidates