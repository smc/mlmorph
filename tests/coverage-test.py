import regex
import os
import unittest
import glob
from time import perf_counter as clock
from mlmorph import Analyser
from collections import Counter

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
MIN_COVERAGE=45.00

def is_valid_malayalam_word(word):
    word = word.strip()
    if(len(word) <= 1):
        return False
    # Ignore all non-Malayalam words
    if regex.search(r"[\u0D00-\u0D7F]+", word) is None:
        return False
    return True


class CoverageTests(unittest.TestCase):
    analyser = Analyser()

    def test_total_coverage(self):

        tokens_count = 0
        analysed_tokens_count = 0
        missed_words = []
        missed_words_file = open('missed_words.txt', 'w')
        freq_analysis_file = open('freq_analysis.txt', 'w')

        print('\t**** Coverage tests ****\t\n',
              end='\n', file=freq_analysis_file)

        start = clock()
        for filename in glob.glob(os.path.join(CURR_DIR, "coverage", "*.txt")):
            with open(filename, 'r') as file:
                for line in file:
                    for word in regex.split(r'([\.\s]+)', line):
                        if not is_valid_malayalam_word(word):
                            continue
                        tokens_count += 1
                        analysis = self.analyser.analyse(word, False)
                        if len(analysis) > 0:
                            analysed_tokens_count += 1
                        else:
                            missed_words.append(word)
                            missed_words_file.write(word+'\n')
        missed_words_file.close()
        percentage = (analysed_tokens_count/tokens_count)*100
        time_taken = clock() - start
        print('Total words: %d \nAnalysed words: %d \nCoverage: %3.2f %% ' %
              (tokens_count, analysed_tokens_count, percentage),
              end='\n', file=freq_analysis_file)
        print('Time taken: %5.3f seconds' %
              (time_taken), end='\n', file=freq_analysis_file)

        most_common = Counter(missed_words).most_common(500)
        print('Top 500 missed words are:', end='\n', file=freq_analysis_file)
        for word, freq in most_common:
            print("%4d %s" % (freq, word), end='\n', file=freq_analysis_file)
        freq_analysis_file.close()
        self.assertTrue(percentage>=MIN_COVERAGE,
                                    'Coverage decreased from %3.2f to %3.2f' % (MIN_COVERAGE, percentage) )
if __name__ == '__main__':
    unittest.main()
