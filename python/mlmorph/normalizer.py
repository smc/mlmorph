normalization_map = {
    'ണ്‍': 'ൺ',
    'ന്‍': 'ൻ',
    'ര്‍': 'ർ',
    'ല്‍': 'ൽ',
    'ള്‍': 'ൾ',
    'ക്‍': 'ൿ',
    'ൻ്റ': 'ന്റ',
    'ൌ': 'ൗ'
}


def normalize(text: str) -> str:
    for key in normalization_map:
        text = text.replace(key, normalization_map[key])
    return text
