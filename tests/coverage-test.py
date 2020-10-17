import regex
import os
import unittest
import glob
from time import perf_counter as clock
from mlmorph import Analyser


CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
MIN_COVERAGE = 54.95


def is_valid_malayalam_word(word):
    word = word.strip()
    if(len(word) <= 1):
        return False
    # Ignore all non-Malayalam words
    if regex.search(r"[\u0D00-\u0D7F\u200C-\u200D]+", word) is None:
        return False
    return True

class CoverageTests(unittest.TestCase):
    analyser = Analyser()

    def test_total_coverage(self):
        total_tokens_count = 0
        total_analysed_tokens_count = 0
        start = clock()
        print("%40s\t%8s\t%8s\t%s" % ('File name', 'Words', 'Analysed', 'Percentage'))
        for filename in glob.glob(os.path.join(CURR_DIR, "coverage", "*.txt")):
            with open(filename, 'r') as file:
                tokens_count = 0
                analysed_tokens_count = 0
                for line in file:
                    for word in regex.split(r'([\.\s]+)', line):
                        if not is_valid_malayalam_word(word):
                            continue
                        tokens_count += 1
                        analysis = self.analyser.analyse(word, False)
                        if len(analysis) > 0:
                            analysed_tokens_count += 1
                percentage = (analysed_tokens_count/tokens_count)*100
                total_tokens_count += tokens_count
                total_analysed_tokens_count += analysed_tokens_count
                print("%40s\t%8d\t%8d\t%3.2f%%" % (os.path.basename(filename), tokens_count, analysed_tokens_count, percentage))
                file.close()
        percentage = (total_analysed_tokens_count/total_tokens_count)*100
        time_taken = clock() - start
        print('%40s\t%8d\t%8d\t%3.2f%%' %
              ('Total', total_tokens_count, total_analysed_tokens_count, percentage))
        print('Time taken: %5.3f seconds' % (time_taken))
        self.assertTrue(percentage >= MIN_COVERAGE,
                                    'Coverage decreased from %3.2f to %3.2f' % (MIN_COVERAGE, percentage) )


if __name__ == '__main__':
    unittest.main()
