import regex


def tokenize(text):
    words = regex.split(r'[-+#\.\s?!\(\)\[\]:,;]', text)
    strip_pattern = r"^[ '?|/!@#$%^&*()_+=`{}\[\]\u200c]+|[ '?|/!@#$%^&*()_+=`{}\[\]\u200c]+$"
    return [regex.sub(strip_pattern, "", word) for word in words]
