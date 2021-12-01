onesStr = [
  "പൂജ്യം",
  "ഒന്ന്",
  "രണ്ട്",
  "മൂന്ന്",
  "നാല്",
  "അഞ്ച്",
  "ആറ്",
  "ഏഴ്",
  "എട്ട്",
  "ഒമ്പത്"
]


def clean(result) : 
      result = result.replace("<ones><hundreds>", "<hundreds>")
      result = result.replace("<ones><tens>", "<tens>")
      result = result.replace("ഒന്ന്<ones><hundreds>", "<hundreds>")
      result = result.replace("ഒന്ന്<ones><thousands>", "<thousands>")
      return result

def positionValues(value) :
      result = ""
      crores = int(value / 10000000) if (value >= 10000000) else 0
      lakhs = int((value % 10000000) / 100000)
      thousands = int((value % 100000) / 1000)
      hundreds = int((value % 1000) / 100)
      tens = int((value % 100) / 10)
      ones = int((value % 10) / 1)
      result = ((positionValues(crores) + "<crores>") if (crores > 0) else  "") + \
        ((positionValues(lakhs) + "<lakhs>") if (lakhs > 0) else "") + \
        ((positionValues(thousands) + "<thousands>") if (thousands > 0) else "") + \
        ((positionValues(hundreds) + "<hundreds>") if (hundreds > 0) else "") + \
        ((positionValues(tens) + "<tens>") if (tens > 0) else "") + \
        ((onesStr[ones] + "<ones>") if (ones > 0) else "") + \
        ((onesStr[ones] + "<zero>") if (value == 0) else "")
      return clean(result)

def spellOut(value) : 
    return positionValues(value) + "<cardinal>" 




if __name__ == '__main__' :
    from mlmorph import Generator
    generator = Generator()
    num = spellOut(100)
    print(generator.generate(num))




