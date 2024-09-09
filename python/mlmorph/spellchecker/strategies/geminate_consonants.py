from .suggestion_strategy import SuggestionStrategy


class GeminateConsonants(SuggestionStrategy):
    """
    Consonant to geminated consonant, if the consonant does not has
    adjacent virama പച്ചതത്ത -> പച്ചത്തത്ത
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
            if self.isConsonant(char):
                candidate[i] = char + '\u0D4D' + char
                i = i+1
                yield ''.join(candidate)

        # De-geminate
        start = 1
        for i in range(start, len(word)-2):
            candidate = list(word)
            char = candidate[i]
            next = candidate[i+1]
            then = candidate[i+2]
            if char == then:
                if self.isConsonant(char) and next == '\u0D4D' and self.isConsonant(then):
                    candidate[i] = char
                    candidate[i+1] = ''
                    candidate[i+2] = ''
                    i = i+2
                    yield ''.join(candidate)

