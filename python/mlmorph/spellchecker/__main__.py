from argparse import ArgumentParser

from mlmorph.spellchecker import SpellChecker


def main():
    spellchecker = SpellChecker()
    parser = ArgumentParser()
    parser.add_argument("words", nargs="*", help="word to spellcheck")
    args = parser.parse_args()
    if args.words:
        for word in args.words:
            word = word.strip()
            if spellchecker.spellcheck(word) is True:
                print("%s \033[92m✔\033[0m" % (word))
            else:
                print(
                    "%s \033[91m❌\033[0m Suggestions: %s" % (word, spellchecker.candidates(word))
                )


if __name__ == "__main__":
    main()
