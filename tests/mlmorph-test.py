import json
import unittest
import sys
import os
import time
from collections import Counter
os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')
from mlmorph import Mlmorph


class Struct:
    def __init__(self, entries):
        self.__dict__.update(**entries)


class AnalyserGeneratorTests(unittest.TestCase):
    mlmorph = Mlmorph('../malayalam.a')

    def setUp(self):
        self.testFile = open('tests.json')
        self.tests = json.load(self.testFile, object_hook=Struct)

    def tearDown(self):
        self.testFile.close()

    def test_analyse(self):
        print('\t**** Analyse tests ****\t')
        line = 0
        for test in self.tests:
            line += 1
            with self.subTest(test.word):
                anals = self.mlmorph.analyse(test.word)
                match = False
                if not (hasattr(test, 'skip') and test.skip):
                    self.assertTrue(len(anals) != 0,
                                    'Analysis failed for ' + test.word)
                else:
                    continue
                print('%3d %s\t<--\t%s' % (line, test.word, anals))
                for index in range(len(anals)):
                    if test.analysis == anals[index][0]:
                        match = True
                        break
                if not (hasattr(test, 'skip') and test.skip):
                    self.assertEqual(
                        match, True, 'Analysis for ' + test.analysis)

    def test_generate(self):
        print('\t**** Generate tests ****\t')
        line = 0
        for test in self.tests:
            line += 1
            with self.subTest(test.word):
                match = False
                gens = self.mlmorph.generate(test.analysis)
                if not (hasattr(test, 'skip') and test.skip):
                    self.assertTrue(
                        len(gens) != 0, 'Generate failed for ' + test.analysis)
                else:
                    continue
                print('%3d %s\t<--\t%s' % (line, test.analysis, gens))
                for index in range(len(gens)):
                    if test.word == gens[index][0]:
                        match = True
                        break
                if not (hasattr(test, 'skip') and test.skip):
                    self.assertEqual(
                        match, True, 'Generate for ' + test.analysis)

    def test_total_coverage(self):
        start = time.clock()
        tokens_count = 0
        analysed_tokens_count = 0
        missed_words = []
        for file_number in range(1,15):
            file = 'coverage/{0:d}.txt'.format(file_number)
            with open(file, 'r') as f:
                for line in f:
                    for word in line.split():
                        tokens_count += 1
                        analysis = self.mlmorph.analyse(word, False)
                        if len(analysis) > 0:
                            analysed_tokens_count += 1
                        else:
                            missed_words.append(word)
        percentage = (analysed_tokens_count/tokens_count)*100
        time_taken = time.clock() - start
        print('\nCoverage test')
        print('Total words: %d \nAnalysed words: %d \nCoverage: %3.2f %% ' %
              (tokens_count, analysed_tokens_count, percentage))
        print('Time taken: %5.3f seconds' % (time_taken))
        print('Top 50 missed words are:\n%s' %
              (Counter(missed_words).most_common(50)))


if __name__ == '__main__':
    unittest.main()
