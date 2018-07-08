from .suggestion_strategy import SuggestionStrategy


class VisualSimilarity(SuggestionStrategy):
    """
    Replace visual confusables
    """
    conversion_map = {
        ':': 'ഃ',
        '0': 'ം',
        'O': 'ഠ',
        'o': 'ം',
        ')': 'ാ',
        '൯': 'ൻ',
        '൪': 'ർ',
        'ഝ': 'ത്സ'
    }

    def suggest(self, word):
        candidates = []
        candidate = word.replace('ത്സ', 'ഝ')
        if candidate != word:
            candidates.append(candidate)
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.conversion_map:
                candidate[i] = self.conversion_map[char]
                start = i+1
                candidates.append(''.join(candidate))
                continue
        return candidates
