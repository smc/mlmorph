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
        'ഝ': 'ത്സ',
        'ത്സ': 'ഝ',
        'ഞ്ജ': 'ജ്ഞ',
        'ജ്ഞ': 'ഞ്ജ',
        'ൃ': '്യ', # Swap ്യ with ൃ and reverse. ക്യ <-> കൃ
        '്യ': 'ൃ',
        '്രു': 'ൃ' # Replace ്ര with ൃ - ഹ്രുദയം - ഹൃദയം
    }

    def suggest(self, word):
        candidates = []
        for key in self.conversion_map:
            candidate = word.replace(key, self.conversion_map[key])
            if candidate != word:
                candidates.append(candidate)
        return candidates
