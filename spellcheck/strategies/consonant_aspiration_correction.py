from .suggestion_strategy import SuggestionStrategy


class ConsonantAspirationCorrection(SuggestionStrategy):
    """
    Aspirated consonant to Unaspirated consonant - Example, ധ -> ദ, ഢ -> ഡ
    Also, the reverse
    """
    aspirated_to_unaspirated_map = {
        'ക': 'ഖ',
        'ഗ': 'ഘ',
        'ച': 'ഛ',
        'ജ': 'ഝ',
        'ട': 'ഠ',
        'ഡ': 'ഢ',
        'ത': 'ഥ',
        'ദ': 'ധ',
        'പ': 'ഫ',
        'ബ': 'ഭ'
    }

    unaspirated_to_aspirated_map = {
        'ഖ': 'ക',
        'ഘ': 'ഗ',
        'ഛ': 'ച',
        'ഝ': 'ജ',
        'ഠ': 'ട',
        'ഢ': 'ഡ',
        'ഥ': 'ത',
        'ധ': 'ദ',
        'ഫ': 'പ',
        'ഭ': 'ബ'
    }

    def suggest(self, word):
        return self.aspirated_2_unaspirated(word)+self.unaspirated_2_aspirated(word)

    def aspirated_2_unaspirated(self, word):
        candidates = []
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.aspirated_to_unaspirated_map:
                candidate[i] = self.aspirated_to_unaspirated_map[char]
                start = i+1
                candidates.append(''.join(candidate))
                continue
        return candidates

    def unaspirated_2_aspirated(self, word):
        candidates = []
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.unaspirated_to_aspirated_map:
                candidate[i] = self.unaspirated_to_aspirated_map[char]
                start = i+1
                candidates.append(''.join(candidate))
                continue
        return candidates


if __name__ == "__main__":
    print(ConsonantAspirationCorrection().suggest('സംഗഗാനം'))
