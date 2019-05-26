from mlmorph import Analyser
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
import re
import argparse
import sys
import json


def parse_args(args):
    parser = argparse.ArgumentParser(
        description="Backend data processor for lexicon-curation app"
    )
    parser.add_argument(
        "-i",
        "--infile",
        metavar="INPUT.txt",
        help="Input text file containing words",
        nargs="?",
    )
    parser.add_argument(
        "-o",
        "--outfile",
        metavar="OUTPUT.json",
        help="Output file containing curated words (json)",
        default="curated_words.json",
        nargs="?",
    )
    return parser.parse_args(args)


class FirebaseLexicon:
    def __init__(self):
        cred = credentials.Certificate(
            "malayalam-lexicon-firebase-adminsdk-z1c51-4f900c1639.json"
        )
        firebase_admin.initialize_app(
            cred, {"databaseURL": "https://malayalam-lexicon.firebaseio.com"}
        )
        self.lexicon = db.reference("/lexicon")

    def add(self, newWord):
        self.lexicon.push(newWord)
        print("[Add]  %s" % (newWord["word"]))

    def remove(self, key):
        self.lexicon.child(key).delete()


    def get(self):
        return self.lexicon.get()


def is_word_exist(new_word, words_in_db):
    for key in words_in_db:
        word = words_in_db[key]
        if word["word"] == new_word:
            return True
    return False


def process_input_file(infile, dbref, analyser, words_in_db):
    with open(infile, "r") as file:
        for line in file:
            for word in line.split():
                # Ignore all non-Malayalam words
                if re.compile(r"[a-zA-Z0-9\(\)=\':°]").match(word):
                    continue
                # Ignore all single ligatures.
                if re.compile(r"^[ാുഅ-ഹൺ-ൿ\.][ാിീുെേൊോൗ്ം]*[.?:]*$").match(word):
                    continue
                analysis = analyser.analyse(word, False)
                if len(analysis) > 0:
                    continue
                if not is_word_exist(word, words_in_db):
                    new_word = {
                        "word": word,
                        "pos": predict_pos(word),
                        "reviewed": False,
                    }
                    dbref.add(new_word)


def predict_pos(word):
    if word.endswith("ിൽ") or word.endswith("ുടെ") or word.endswith("ിന്റെ"):
        return "n"
    if word.endswith("ക്കുക") or word.endswith("ച്ചു") or word.endswith("ഞ്ഞു"):
        return "v"
    return ""


def process_words_in_db(words_in_db, dbref, analyser, outfile):
    curated_words = []
    for key in words_in_db:
        word_ref = words_in_db[key]
        if word_ref["reviewed"]:
            curated_words.append(word_ref)
            print("[Get]  %s" % (word_ref["word"]))
        analysis = analyser.analyse(word_ref['word'], False)
        if len(analysis) > 0:
            print("[Remove] %s" % (word_ref['word']))
            dbref.remove(key)
    with open(outfile, "w") as outfile:
        json.dump(curated_words, outfile, sort_keys=True, indent=4, ensure_ascii=False)


def main(args=None):
    options = parse_args(args)
    dbref = FirebaseLexicon()
    analyser = Analyser()
    words_in_db = dbref.get()
    if not words_in_db:
        words_in_db = {}
    process_words_in_db(words_in_db, dbref, analyser, options.outfile)
    if options.infile:
        process_input_file(options.infile, dbref, analyser, words_in_db)


if __name__ == "__main__":
    sys.exit(main())
