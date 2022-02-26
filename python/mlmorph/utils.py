import regex

def tokenize(text):
    words = regex.split('[-+#\.\s?!\(\)\[\]:,;]', text)
    return [word.strip(" '?|/!@#$%^&*()_+=`\{\}[]\u200c") for word in words]

