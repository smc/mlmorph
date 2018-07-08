from .suggestion_strategy import SuggestionStrategy


class GeminateConsonants(SuggestionStrategy):
    """
    Consonant to geminated consonant, if the consonant does not has
    adjacent virama പച്ചതത്ത -> പച്ചത്തത്ത
    """

    def suggest(self, word):
        candidates = []
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
                candidates.append(''.join(candidate))
                i = i+1
                continue

        return candidates


if __name__ == "__main__":
    print(GeminateConsonants().suggest('വരുനു') )
    print(GeminateConsonants().suggest('കത്തുനു'))
