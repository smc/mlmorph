import sys
import os
import unittest
import re
import glob
import time
from mlmorph import Mlmorph
from collections import Counter

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))

class CoverageTests(unittest.TestCase):
    mlmorph = Mlmorph()

    def test_total_coverage(self):
        print('\t**** Coverage tests ****\t\n')
        start = time.clock()
        tokens_count = 0
        analysed_tokens_count = 0
        missed_words = []

        for filename in glob.glob(os.path.join(CURR_DIR, "coverage", "*.txt") ):
            with open(filename, 'r') as file:
                for line in file:
                    for word in line.split():
                        if re.compile(r'[a-zA-Z0-9\(\)=]').match(word):
                            continue
                        tokens_count += 1
                        analysis = self.mlmorph.analyse(word, False)
                        if len(analysis) > 0:
                            analysed_tokens_count += 1
                        else:
                            missed_words.append(word)
        percentage = (analysed_tokens_count/tokens_count)*100
        time_taken = time.clock() - start
        print('Total words: %d \nAnalysed words: %d \nCoverage: %3.2f %% ' %
              (tokens_count, analysed_tokens_count, percentage))
        print('Time taken: %5.3f seconds' % (time_taken))

        most_common = Counter(missed_words).most_common(250)
        print('Top 250 missed words are:' )
        for word in most_common:
            print( word )
