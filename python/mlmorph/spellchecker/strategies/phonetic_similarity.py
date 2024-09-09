from .suggestion_strategy import SuggestionStrategy


class PhoneticSimilarity(SuggestionStrategy):
    def suggest(self, word):
        confusables = ['കഖഗഘ', 'ചഛജഝ', 'ടഠഡഢ',
                       'തഥദധ', 'പഫബഭ', 'രറ', 'ലള', 'ശഷസ']
        for confusable in confusables:
            candidates = self.getCandidatesWithReplacements(word, confusable)
            for candidate in candidates:
                if candidate != word:
                    yield candidate

        candidate = word.replace('ദ്ധ', 'ധ')
        if word != candidate:
            yield candidate
        candidate = word.replace('ധ', 'ദ്ധ')
        if word != candidate:
            yield candidate
        candidate = word.replace('ശ്ച', 'ച്ഛ')
        if word != candidate:
            yield candidate

        candidate = word.replace('ച്ഛ', 'ശ്ച')
        if word != candidate:
            yield candidate

        candidate = word.replace('ഷ', 'ക്ഷ')
        if word != candidate:
            yield candidate

        candidate = word.replace('ക്ഷ', 'ഷ')  # പ്രതിക്ഷേധം
        if word != candidate:
            yield candidate


if __name__ == "__main__":
    strategy = PhoneticSimilarity()
    candidates = strategy.suggest('സംസ്താനം')
    print(list(candidates))
