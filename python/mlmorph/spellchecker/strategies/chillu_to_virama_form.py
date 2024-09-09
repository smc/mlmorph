from .suggestion_strategy import SuggestionStrategy


class ChilluToConsonantVirama(SuggestionStrategy):
    """
   Replace chillu with its consonant+virama form. So ർ -> ര്
    """
    conversion_map = {
        'ർ': 'ര്',
        'ൽ': 'ല്',
        'ൻ': 'ന്',
        'ൺ': 'ണ്',
        'ൾ': 'ള്',
        'ം': 'മ്'
    }

    def suggest(self, word):
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.conversion_map:
                candidate[i] = self.conversion_map[char]
                start = i+1
                yield ''.join(candidate)
