from argparse import ArgumentParser
from sys import stdin
from mlmorph import Generator, Analyser, check_foreign_word


def main():
    """Invoke a simple CLI analyser or generator."""
    a = ArgumentParser()
    a.add_argument('-i', '--input', metavar="INFILE", type=open,
                   dest="infile", help="source of analysis data")
    a.add_argument('-a', '--analyse', action='store_true',
                   help="Analyse the input file strings")
    a.add_argument('-g', '--generate', action='store_true',
                   help="Generate the input file strings")
    a.add_argument('-f', '--foreign', action='store_true',
                   help="Check if the word is foreign word or not")
    a.add_argument('-v', '--verbose', action='store_true',
                   help="print verbosely while processing")
    options = a.parse_args()

    if not options.infile:
        options.infile = stdin
    if options.verbose:
        print("reading from", options.infile.name)
    analyser = Analyser()
    generator = Generator()
    for line in options.infile:
        line = line.strip()
        if not line or line == '':
            continue
        if options.analyse:
            anals = analyser.analyse(line, True)
            if not anals:
                print(line, "\t?")
            for anal in anals:
                print(line, "\t", anal[0], "\t", anal[1])
        if options.generate:
            gens = generator.generate(line, True)
            if not gens:
                print(line, "\t?")
            for gen in gens:
                print(line, "\t",  gen[0], "\t", gen[1])
        if options.foreign:
            is_foreign = check_foreign_word(line)
            print(line, "\t", is_foreign)
    print()
    exit(0)


if __name__ == "__main__":
    main()
