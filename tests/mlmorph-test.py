import json
import unittest
import sys
import os
import re

from mlmorph import Generator, Analyser

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))

class Struct:
    def __init__(self, entries):
        self.__dict__.update(**entries)


class AnalyserGeneratorTests(unittest.TestCase):
    generator = Generator()
    analyser = Analyser()

    def setUp(self):
        self.testFile = open(os.path.join(CURR_DIR, 'tests.json'))
        self.tests = json.load(self.testFile, object_hook=Struct)

    def tearDown(self):
        self.testFile.close()

    def test_analyse(self):
        print('\t**** Analyse tests ****\t')
        line = 0
        for test in self.tests:
            line += 1
            with self.subTest(test.word):
                anals = self.analyser.analyse(test.word)
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
                gens = self.generator.generate(test.analysis, True)
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

if __name__ == '__main__':
    unittest.main()
