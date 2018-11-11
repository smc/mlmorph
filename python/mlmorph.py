#!/usr/bin/env python

"""
Simple python interface for mlmorph using liblibhfst-python.
"""

from argparse import ArgumentParser
from sys import stdin
import os
import regex
import libhfst


class Mlmorph:

    def __init__(self, fsa, verbosity=False):
        """Construct Mlmorph with given verbosity for printouts."""
        self._verbosity = verbosity
        self.fsa = fsa
        self.transducer = None
        self.analyser = None
        self.generator = None
        self._cached_stamp = 0
        self.analyser_regex = regex.compile( r"((?P<root>([^<])+)(?P<tags>(<[^>]+>)+))+" )
        self.pos_regex = regex.compile(r"(<(?P<tag>([^>]+))>)+")

    def load_filename(self, fsa):
        istr = libhfst.HfstInputStream(fsa)
        transducers = []
        while not (istr.is_eof()):
            transducers.append(istr.read())
        istr.close()
        self.transducer = transducers[0]

    def reload(self):
        self.transducer = None
        self.generator = self.getGenerator()
        self.analyser = self.getAnalyser()

    def getGenerator(self):
        if not self.transducer:
            self.load_filename(self.fsa)
        generator = libhfst.HfstTransducer(self.transducer)
        generator.remove_epsilons()
        generator.lookup_optimize()
        self.generator = generator

    def getAnalyser(self):
        if not self.transducer:
            self.load_filename(self.fsa)
        analyser = libhfst.HfstTransducer(self.transducer)
        analyser.invert()
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        self.analyser = analyser

    def analyse(self, token, weighted=True):
        """Perform a simple morphological analysis lookup. """
        stamp = os.stat(self.fsa).st_mtime
        if stamp != self._cached_stamp:
            self._cached_stamp = stamp
            self.reload()
        if not self.analyser:
            self.getAnalyser()
        analysis_results = self.analyser.lookup(token)
        if not weighted:
            return analysis_results

        processed_result=[]
        for aindex in range(len(analysis_results)):
            parsed_result = self.parse_analysis(analysis_results[aindex])
            processed_result.append((analysis_results[aindex][0], parsed_result['weight']))
        return processed_result

    def generate(self, token):
        """Perform a simple morphological generator lookup."""
        stamp = os.stat(self.fsa).st_mtime
        if stamp != self._cached_stamp:
            self._cached_stamp = stamp
            self.reload()
        if not self.generator:
            self.getGenerator()
        return self.generator.lookup(token)

    def parse_analysis(self, analysis_result):
        result = {}
        if analysis_result is None:
            return result

        analysis = analysis_result[0]
        if analysis[0] == '<':
            analysis = ' ' + analysis
        match = self.analyser_regex.match(analysis)
        roots = match.captures("root")
        morphemes = []
        for rindex in range(len(roots)):
            morpheme = {}
            morpheme['root'] = roots[rindex]
            tags = match.captures("tags")[rindex]
            morpheme['pos'] = self.pos_regex.match(tags).captures("tag")
            morphemes.append(morpheme)

        result['morphemes'] = morphemes
        result['weight'] = self.get_weight(morphemes)
        return result

    def get_weight(self, analysis):
        """Analysis with less weight is the best analysis."""
        morpheme_length = len(analysis)
        weight = morpheme_length*100
        for i in range(morpheme_length):
            pos = analysis[i]['pos']
            root = analysis[i]['root']
            for j in range(len(pos)):
                # In general, favor simplicity
                # Prefer analysis with less number of tags
                # Prefer anaysis with small length roots
                weight += len(pos)*5 + len(root)*2 + self.get_pos_weight(pos[j])*3
        return weight

    def get_pos_weight(self, pos):
        """Get the relative weight of a pos tag. Less weight is the preferred pos tag."""
        WEIGHTS = {
            # Prefer verbs than nouns
            'v': 1,
            'n': 2,
            # Among three letter codes, prefer adv. Then adj, Then pronoun
            'adv': 3,
            'adj': 4,
            'prn': 5,
            # Favor cvb-adv-part-past മുൻവിനയെച്ചം without using its length
            'past' : 4,
            'cvb-adv-part-past': 5,
            # Proper noun has high cost
            'np': 5
        }
        # Use the WEIGHTS or fallback to length
        return WEIGHTS.get(pos, len(pos))

def main():
    """Invoke a simple CLI analyser or generator."""
    a = ArgumentParser()
    a.add_argument('-f', '--fsa', metavar='FSAPATH',
                   help="Path to the automata")
    a.add_argument('-i', '--input', metavar="INFILE", type=open,
                   dest="infile", help="source of analysis data")
    a.add_argument('-a', '--analyse', action='store_true',
                   help="Analyse the input file strings")
    a.add_argument('-g', '--generate', action='store_true',
                   help="Generate the input file strings")
    a.add_argument('-v', '--verbose', action='store_true',
                   help="print verbosely while processing")
    options = a.parse_args()
    if options.fsa:
        mlmorph = Mlmorph(options.fsa, options.verbose)
    if not options.infile:
        options.infile = stdin
    if options.verbose:
        print("reading from", options.infile.name)
    for line in options.infile:
        line = line.strip()
        if not line or line == '':
            continue
        if options.analyse:
            anals = mlmorph.analyse(line)
            if not anals:
                print(line, "\t?")
            for anal in anals:
                print(line, "\t", anal[0])
        if options.generate:
            gens = mlmorph.generate(line)
            if not gens:
                print(line, "\t?")
            for gen in gens:
                print(line, "\t",  gen[0])

    print()
    exit(0)


if __name__ == "__main__":
    main()
