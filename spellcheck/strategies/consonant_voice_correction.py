from .suggestion_strategy import SuggestionStrategy


class ConsonantVoiceCorrection(SuggestionStrategy):
    """
    മൃദു -> ഖരം
    ഖരം -> മൃദു
    """
    voiceless_to_voiced_map = {
        'ക': 'ഗ',
        'ഖ': 'ഘ',
        'ച': 'ജ',
        'ഛ': 'ഝ',
        'ട': 'ഡ',
        'ഠ': 'ഢ',
        'ത': 'ദ',
        'ഥ': 'ധ',
        'പ': 'ബ',
        'ഫ': 'ഭ'
    }

    voiced_to_voiceless_map = {
        'ഗ': 'ക',
        'ഘ': 'ഖ',
        'ജ': 'ച',
        'ഝ': 'ഛ',
        'ഡ': 'ട',
        'ഢ': 'ഠ',
        'ദ': 'ത',
        'ധ': 'ഥ',
        'ബ': 'പ',
        'ഭ': 'ഫ'
    }

    def suggest(self, word):
        return self.voiceless_to_voiced(word)+self.voiced_to_voiceless(word)

    def voiceless_to_voiced(self, word):
        candidates = []
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.voiceless_to_voiced_map:
                candidate[i] = self.voiceless_to_voiced_map[char]
                start = i+1
                candidates.append(''.join(candidate))
                continue
        return candidates

    def voiced_to_voiceless(self, word):
        candidates = []
        start = 1
        for i in range(start, len(word)):
            candidate = list(word)
            char = candidate[i]
            if char in self.voiced_to_voiceless_map:
                candidate[i] = self.voiced_to_voiceless_map[char]
                start = i+1
                candidates.append(''.join(candidate))
                continue
        return candidates


if __name__ == "__main__":
    print(ConsonantVoiceCorrection().suggest('സംഗഗാനം'))
