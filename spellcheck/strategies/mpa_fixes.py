from strategies import SuggestionStrategy


class MpaFixes(SuggestionStrategy):
    """
    Replace ന്പ, ൻപ, ംപ, ംമ്പ with മ്പ
    """

    def suggest(self, word):
        candidates = []
        candidate = word.replace('ന്പ', 'മ്പ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ൻപ', 'മ്പ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ംപ', 'മ്പ')
        if candidate != word:
            candidates.append(candidate)
        candidate = word.replace('ംമ്പ', 'മ്പ')
        if candidate != word:
            candidates.append(candidate)

        return candidates