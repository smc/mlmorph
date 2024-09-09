from .suggestion_strategy import SuggestionStrategy


class ViramaInsertion(SuggestionStrategy):
    """
    Insert virama between two adjacent consonants. അദധ്വാനം -> അദ്ധ്വാനം
    """

    def suggest(self, word):
        start = 1
        for i in range(start, len(word)-1):
            candidate = list(word)
            prev = candidate[i-1]
            char = candidate[i]
            next = candidate[i+1]
            if prev == '\u0D4D' or next == '\u0D4D':  # Virama
                i = i+1
                continue
            if self.isConsonant(char) and self.isConsonant(next):
                candidate[i] = char + '\u0D4D'
                yield ''.join(candidate)
                i = i+1
                continue

