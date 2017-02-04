#!/usr/bin/env python

"""
Simple python interface for omorfi using libhfst-python. Consider this
class as a standard python interface to omorfi and standard reference for
scientific studies, as far as python use goes.
"""

from argparse import ArgumentParser
from sys import stderr, stdin

import hfst

class Mlmorph:

    def __init__(self, fsa, verbosity=False):
        """Construct Mlmorph with given verbosity for printouts."""
        self._verbosity = verbosity
        self.fsa = fsa
        self.transducer = None
        self.analyser = None
        self.generator = None

    def load_filename(self, fsa):
        istr = hfst.HfstInputStream(fsa)
        transducers = []
        while not (istr.is_eof()):
            transducers.append(istr.read())
        istr.close()
        self.transducer = transducers[0]

    def getGenerator(self):
        if not self.transducer:
            self.load_filename(self.fsa)
        generator = hfst.HfstTransducer(self.transducer)
        generator.remove_epsilons()
        generator.lookup_optimize()
        self.generator = generator

    def getAnalyser(self):
        if not self.transducer:
            self.load_filename(self.fsa)
        analyser = hfst.HfstTransducer(self.transducer)
        analyser.invert()
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        self.analyser = analyser

    def analyse(self, token):
        """Perform a simple morphological analysis lookup. """
        if not self.analyser:
            self.getAnalyser()
        return self.analyser.lookup(token)

    def generate(self, token):
        """Perform a simple morphological generator lookup."""
        if not self.generator:
            self.getGenerator()
        return self.generator.lookup(token)


def main():
    """Invoke a simple CLI analyser or generator."""
    a = ArgumentParser()
    a.add_argument('-f', '--fsa', metavar='FSAPATH',
                   help="Path to directory of HFST format automata")
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
