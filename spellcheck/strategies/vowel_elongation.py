from strategies import SuggestionStrategy


class VowelElongation(SuggestionStrategy):
    """
    Vowel sign elongation - Elongate the short vowels present in the word.
    For example, if w is കോഴിക്കൊട്, this strategy outputs കോഴിക്കോട്
    """
    elongation_map = {
        'അ': 'ാ',
        'ി': 'ീ',
        'ു': 'ൂ',
        'െ': 'േ',
        'ൊ': 'ോ'
    }

    def suggest(self, word):
        candidates = []
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.elongation_map:
                candidate[i] = self.elongation_map[char]
                start = i+1
                candidates.append(''.join(candidate))
                continue
        return candidates
