import regex
import os
import glob
from mlmorph import Analyser, tokenize
import csv
from tqdm import tqdm
import mmap


def is_valid_malayalam_word(word):
    word = word.strip()
    if len(word) <= 1:
        return False
    # Ignore all non-Malayalam words
    if regex.search(r"[\u0D00-\u0D7F\u200C-\u200D]+", word) is None:
        return False
    return True


def get_words(file_path):
    words = []
    with open(file_path, "r") as f:
        map_file = mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ)
        for line in iter(map_file.readline, b""):
            tokens = tokenize(line.decode("utf-8"))
            for word in tokens:
                if not is_valid_malayalam_word(word):
                    continue
                else:
                    words.append(word)
    return words


analyser = Analyser()

csvfilename = "mlmorph.csv"
with open(csvfilename, 'w') as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerow(["word", "analysis"])
    files = glob.glob(os.path.join("tests", "coverage", "*.txt"))
    for filename in files:
        with open(filename, 'r') as file:
            tokens_count = 0
            analysed_tokens_count = 0
            rows = []
            words = get_words(filename)
            for word in tqdm(words, desc=filename):
                analysis = analyser.analyse(word, True)
                if len(analysis) > 0:
                    rows.append([word, analysis[0][0]])
            csvwriter.writerows(rows)
            file.close()
