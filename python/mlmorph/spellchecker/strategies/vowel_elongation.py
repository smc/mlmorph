from .suggestion_strategy import SuggestionStrategy


class VowelElongation(SuggestionStrategy):
    """
    Vowel sign elongation - Elongate the short vowels present in the word.
    For example, if w is കോഴിക്കൊട്, this strategy outputs കോഴിക്കോട്
    """
    elongation_map = {
        'ി': 'ീ',
        'ു': 'ൂ',
        'െ': 'േ',
        'ൊ': 'ോ'
    }

    def suggest(self, word):
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.elongation_map:
                candidate[i] = self.elongation_map[char]
                start = i+1
                yield ''.join(candidate)
                continue
            if i == len(word)-1:
                continue
            next_char = candidate[i+1]
            if self.isConsonant(char) and self.isConsonant(next_char):
                candidate[i] = char+'ാ'
                yield ''.join(candidate)
