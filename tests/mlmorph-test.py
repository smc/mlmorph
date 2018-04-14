import csv
import unittest
import sys
import os
os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')
from mlmorph import Mlmorph


class AnalyserGeneratorTests(unittest.TestCase):

    def setUp(self):
        self.csvfile = open('data.tsv', newline='', encoding='utf-8')
        fsa = '../malayalam.a'
        dialect = csv.Sniffer().sniff(self.csvfile.read(1024))
        # rewind
        self.csvfile.seek(0)
        self.data = csv.reader(self.csvfile, dialect)
        self.mlmorph = Mlmorph(fsa)

    def tearDown(self):
        self.csvfile.close()

    def test_analyse(self):
        print('\t**** Analyse tests ****\t')
        line=0
        for row in self.data:
            line += 1
            with self.subTest(row[0]):
                anals = self.mlmorph.analyse(row[0])
                match = False
                self.assertTrue(len(anals) != 0,
                                'Analysis failed for ' + row[0])
                print('%3d %s\t<--\t%s' % (line, row[0], anals))
                for index in range(len(anals)):
                    if row[1] == anals[index][0]:
                        match = True
                        break
                self.assertEqual(match, True, 'Analysis for ' + row[1])

    def test_generate(self):
        print('\t**** Generate tests ****\t')
        line=0
        for row in self.data:
            line += 1
            with self.subTest(row[0]):
                match = False
                gens = self.mlmorph.generate(row[1])
                self.assertTrue(
                    len(gens) != 0, 'Generate failed for ' + row[1])
                print('%3d %s\t<--\t%s' % (line, row[1], gens))
                for index in range(len(gens)):
                    if row[0] == gens[index][0]:
                        match = True
                        break
                self.assertEqual(match, True, 'Generate for ' + row[1])

if __name__ == '__main__':
    unittest.main()
