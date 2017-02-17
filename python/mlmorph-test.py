from mlmorph import Mlmorph
import csv
import unittest

class AnalyserGeneratorTests(unittest.TestCase):
    def setUp(self):
        self.csvfile = open('tests/data.tsv')
        fsa = 'malayalam.a'
        dialect = csv.Sniffer().sniff(self.csvfile.read(1024))
        # rewind
        self.csvfile.seek(0)
        self.data = csv.reader(self.csvfile, dialect)
        self.mlmorph = Mlmorph(fsa)

    def tearDown(self):
        self.csvfile.close()
    def test_analyse(self):
        for row in self.data:
            with self.subTest():
                print(row)
                anals = self.mlmorph.analyse(row[0])
                self.assertTrue(len(anals) != 0, 'Analysis failed for ' + row[0])
                for index in range(len(anals)):
                    self.assertEqual(row[index+1], anals[index][0])

    def test_generate(self):
        for row in self.data:
            with self.subTest():
                print(row)
                gens = self.mlmorph.generate(row[1])
                self.assertTrue(len(gens) != 0, 'Generate failed for ' + row[1])
                for index in range(len(gens)):
                    self.assertEqual(row[0], gens[index][0],  'Generate for ' + row[1])

if __name__ == '__main__':
    unittest.main()
