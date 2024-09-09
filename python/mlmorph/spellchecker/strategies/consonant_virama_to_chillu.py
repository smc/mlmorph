from .suggestion_strategy import SuggestionStrategy


class ConsonantViramaToChillu(SuggestionStrategy):
    """
    Replace ര്, ല്, ണ്, റ്, ന്, ള്, മ് with its chillu forms. ര് -> ർ, ള് -> ൾ
    """
    conversion_map = {
        'ര്': 'ർ',
        'റ്': 'ർ',
        'ല്': 'ൽ',
        'ന്': 'ൻ',
        'ണ്': 'ൺ',
        'ള്': 'ൾ',
        'മ്': 'ം'
    }

    def suggest(self, word):
        start = 2
        for i in range(start, len(word)-1):
            candidate = list(word)
            consvirama = candidate[i]+candidate[i+1]
            if consvirama in self.conversion_map:
                candidate[i] = self.conversion_map[consvirama]
                candidate[i+1]=''
                start = i+2
                yield ''.join(candidate)
