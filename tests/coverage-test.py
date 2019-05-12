import sys
import os
import unittest
import re
import glob
from time import perf_counter as clock
from mlmorph import Analyser
from collections import Counter

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))

class CoverageTests(unittest.TestCase):
    analyser = Analyser()

    def test_total_coverage(self):
        print('\t**** Coverage tests ****\t\n')
        start = clock()
        tokens_count = 0
        analysed_tokens_count = 0
        missed_words = []

        for filename in glob.glob(os.path.join(CURR_DIR, "coverage", "*.txt") ):
            with open(filename, 'r') as file:
                for line in file:
                    for word in line.split():
                        # Ignore all non-Malayalam words
                        if re.compile(r'[a-zA-Z0-9\(\)=\':°]').match(word):
                            continue
                        # Ignore all single ligatures.
                        if re.compile(r'^[ാുഅ-ഹൺ-ൿ\.][ാിീുെേൊോൗ്ം]*[.?:]*$').match(word):
                            continue
                        tokens_count += 1
                        analysis = self.analyser.analyse(word, False)
                        if len(analysis) > 0:
                            analysed_tokens_count += 1
                        else:
                            missed_words.append(word)
        percentage = (analysed_tokens_count/tokens_count)*100
        time_taken = clock() - start
        print('Total words: %d \nAnalysed words: %d \nCoverage: %3.2f %% ' %
              (tokens_count, analysed_tokens_count, percentage))
        print('Time taken: %5.3f seconds' % (time_taken))

        most_common = Counter(missed_words).most_common(250)
        print('Top 250 missed words are:' )
        for word in most_common:
            print( word )

if __name__ == '__main__':
    unittest.main()