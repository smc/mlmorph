from argparse import ArgumentParser
from sys import stdin
from mlmorph import Mlmorph

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
