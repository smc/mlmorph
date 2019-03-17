#!/usr/bin/env python

"""
Simple python interface for mlmorph using liblibhfst-python.
"""

from sys import stdin
import os
import regex
import libhfst
from pkg_resources import resource_filename, resource_exists


def get_transducer(fsa):
    istr = libhfst.HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]


class Analyser:

    ANALYSER_REGEX = regex.compile(r"((?P<root>([^<])+)(?P<tags>(<[^>]+>)+))+")
    POS_REGEX = regex.compile(r"(<(?P<tag>([^>]+))>)+")
    RESOURCE_PATH = 'data/malayalam.a'

    def __init__(self):
        """Construct Mlmorph Analyser"""
        self.fsa = None
        if resource_exists(__name__, Analyser.RESOURCE_PATH):
            self.fsa = resource_filename(__name__, Analyser.RESOURCE_PATH)
        if not self.fsa:
            raise ValueError('Could not read the fsa.')
        self.transducer = None
        self.analyser = None

    def get_analyser(self):
        if not self.transducer:
            self.transducer = get_transducer(self.fsa)
        analyser = libhfst.HfstTransducer(self.transducer)
        analyser.invert()
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        return analyser

    def analyse(self, token, weighted=True):
        """Perform a simple morphological analysis lookup. """
        if not self.analyser:
            self.analyser = self.get_analyser()
        analysis_results = self.analyser.lookup(token)
        if not weighted:
            return analysis_results

        processed_result = []
        for aindex in range(len(analysis_results)):
            parsed_result = Analyser.parse_analysis(
                analysis_results[aindex][0])
            processed_result.append(
                (analysis_results[aindex][0], parsed_result['weight']))
        return sorted(processed_result, key=lambda tup: tup[1])

    @staticmethod
    def parse_analysis(analysis: str) -> dict:
        result = {}
        if analysis is None:
            return result

        if analysis[0] == '<':
            analysis = ' ' + analysis
        match = Analyser.ANALYSER_REGEX.match(analysis)
        if not match:
            raise ValueError('Could not parse the analysis.' + analysis)
        roots = match.captures("root")
        morphemes = []
        for rindex in range(len(roots)):
            morpheme = {}
            morpheme['root'] = roots[rindex]
            tags = match.captures("tags")[rindex]
            morpheme['pos'] = Analyser.POS_REGEX.match(tags).captures("tag")
            morphemes.append(morpheme)

        result['morphemes'] = morphemes
        result['weight'] = Analyser.get_weight(morphemes)
        return result

    @staticmethod
    def get_weight(analysis):
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
                weight += len(pos)*5 + len(root)*2 + \
                    Analyser.get_pos_weight(pos[j])*3
        return weight

    @staticmethod
    def get_pos_weight(pos: str) -> int:
        """Get the relative weight of a pos tag. Less weight is the preferred pos tag."""
        WEIGHTS = {
            # Prefer verbs than nouns
            'v': 1,
            'n': 2,
            # Among three letter codes, prefer adv. Then adj, Then pronoun
            'adv': 3,
            'adj': 4,
            'coordinative': 4,
            'v-n-compound': 4,
            'prn': 5,
            # Favor cvb-adv-part-past മുൻവിനയെച്ചം without using its length
            'past': 4,
            'cvb-adv-part-past': 5,
            # Proper noun has high cost
            'np': 5
        }
        # Use the WEIGHTS or fallback to length
        return WEIGHTS.get(pos, len(pos))


class Generator:
    RESOURCE_PATH = 'data/malayalam.a'

    def __init__(self):
        """Construct Mlmorph Generator"""
        self.fsa = None
        if resource_exists(__name__, Generator.RESOURCE_PATH):
            self.fsa = resource_filename(__name__, Generator.RESOURCE_PATH)
        if not self.fsa:
            raise ValueError('Could not read the fsa.')
        self.transducer = None
        self.generator = None

    @staticmethod
    def get_weight(generated_word: str, token: str) -> int:
        """
        Get the weight for the generated word.
        Uses the weight of input token as the base weight.

        Give priority for smaller words, collation order.
        """

        suffixes = ['ിൽ','ിലും', 'ന്റെ','ന്','നെ']
        token_weight = Analyser.parse_analysis(token)['weight']
        length = len(suffixes)
        weight = token_weight
        for i in range(length):
            if generated_word.endswith(suffixes[i]):
                return weight+i
        return weight+len(generated_word)

    def generate(self, token: str, weighted: bool = True) -> tuple:
        """Perform a simple morphological generator lookup."""
        if not self.generator:
            self.generator = self.get_generator()
        generated_results = self.generator.lookup(token)
        if not weighted:
            return generated_results

        processed_result = []
        for gindex in range(len(generated_results)):
            generated_result_weight = Generator.get_weight(
                generated_results[gindex][0], token)
            processed_result.append(
                (generated_results[gindex][0], generated_result_weight))
        return sorted(processed_result, key=lambda tup: tup[1])

    def get_generator(self):
        if not self.transducer:
            self.transducer = get_transducer(self.fsa)
        generator = libhfst.HfstTransducer(self.transducer)
        generator.remove_epsilons()
        generator.lookup_optimize()
        return generator
