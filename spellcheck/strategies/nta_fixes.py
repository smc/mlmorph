from strategies import SuggestionStrategy


class NtaFixes(SuggestionStrategy):
    """
    Replace ൻറ, ൻ്റ with ന്റ
    """

    def suggest(self, word):
        candidates = []
        candidate = word.replace('ൻറ', 'ന്റ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ൻ്റ', 'ന്റ')
        if candidate != word:
            candidates.append(candidate)
        return candidates