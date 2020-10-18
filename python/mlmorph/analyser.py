#!/usr/bin/env python

"""
Simple python interface for mlmorph using libhfst-python.
"""

import regex
from libhfst import HfstTransducer
from typing import List, Tuple
from pkg_resources import resource_filename, resource_exists
from .normalizer import normalize
from .foreign_word_detector import check_foreign_word
from .utils import get_transducer


class Analyser:

    ANALYSER_REGEX = regex.compile(r"((?P<root>([^<])+)(?P<tags>(<[^>]+>)+))+")
    POS_REGEX = regex.compile(r"(<(?P<tag>([^>]+))>)+")
    RESOURCE_PATH = "data/malayalam.a"

    def __init__(self):
        """Construct Mlmorph Analyser"""
        self.fsa: str = None
        if resource_exists(__name__, Analyser.RESOURCE_PATH):
            self.fsa: str = resource_filename(__name__, Analyser.RESOURCE_PATH)
        if not self.fsa:
            raise ValueError("Could not read the fsa.")
        self.transducer: HfstTransducer = None
        self.analyser: HfstTransducer = None

    def get_analyser(self) -> HfstTransducer:
        if not self.transducer:
            self.transducer = get_transducer(self.fsa)
        analyser = HfstTransducer(self.transducer)
        analyser.invert()
        analyser.remove_epsilons()
        analyser.lookup_optimize()
        return analyser

    def analyse(
        self, word: str, weighted: bool = True, foreign_word_check: bool = True
    ) -> List[Tuple[str, int]]:
        """
        Perform a simple morphological analysis lookup.

        Parameters
        ----------

        - word : The word to analyse
        - weighted : Return result with analyser weights. Default: True,
        - foreign_word_check: Use foreign word detector. Default: True

        Returns
        -------
        Array of tuples with analysis string and weight
        """

        if not self.analyser:
            self.analyser = self.get_analyser()
        word = normalize(word)
        analysis_results = self.analyser.lookup(word)
        if not len(analysis_results):
            if foreign_word_check and check_foreign_word(word):
                if weighted:
                    analysis_results = [(word + "<fw>", 100)]
                else:
                    analysis_results = [(word + "<fw>", 0)]

        if not weighted:
            return analysis_results

        processed_result = []
        for aindex in range(len(analysis_results)):
            weight = 0
            analysis = analysis_results[aindex][0]
            if weighted:
                parsed_result = Analyser.parse_analysis(analysis)
                weight = parsed_result["weight"]
            processed_result.append((analysis, weight))

        return sorted(processed_result, key=lambda tup: tup[1])

    @staticmethod
    def parse_analysis(analysis: str) -> dict:
        """
        Parse the analysis string and return a dict with structured data.

        Parameters
        ----------

        - analysis : The analysis string

        Returns
        -------
        Dictionary with the following structure
        ```
        {
            morphemes: [
                {root:"rootword1", pos:[pos1, pos2] }
                {root:"rootword2", pos:[pos1, pos2] }
            ]
            weight: 200
        }
        ```
        """
        result = {}
        if analysis is None:
            return result

        if analysis[0] == "<":
            analysis = " " + analysis
        match = Analyser.ANALYSER_REGEX.match(analysis)
        if not match:
            raise ValueError("Could not parse the analysis." + analysis)
        roots = match.captures("root")
        morphemes = []
        for rindex in range(len(roots)):
            morpheme = {}
            morpheme["root"] = roots[rindex]
            tags = match.captures("tags")[rindex]
            morpheme["pos"] = Analyser.POS_REGEX.match(tags).captures("tag")
            morphemes.append(morpheme)

        result["morphemes"] = morphemes
        result["weight"] = Analyser.get_weight(morphemes)
        return result

    @staticmethod
    def get_weight(analysis: str) -> int:
        """Analysis with less weight is the best analysis."""
        morpheme_length = len(analysis)
        weight = morpheme_length * 100
        for i in range(morpheme_length):
            pos = analysis[i]["pos"]
            root = analysis[i]["root"]
            for j in range(len(pos)):
                # In general, favor simplicity
                # Prefer analysis with less number of tags
                # Prefer analysis with small length roots
                weight += (
                    len(pos) * 5 + len(root) * 2 + Analyser.get_pos_weight(pos[j]) * 3
                )
        return weight

    @staticmethod
    def get_pos_weight(pos: str) -> int:
        """
        Get the relative weight of a pos tag.
        Less weight is the preferred pos tag.
        """
        WEIGHTS = {
            # Prefer verbs than nouns
            "v": 1,
            "n": 2,
            # Among three letter codes, prefer adv. Then adj, Then pronoun
            "adv": 3,
            "adj": 4,
            "coordinative": 4,
            "v-n-compound": 4,
            "prn": 5,
            # Favor cvb-adv-part-past മുൻവിനയെച്ചം without using its length
            "past": 4,
            "cvb-adv-part-past": 5,
            # Proper noun has high cost
            "np": 5,
        }
        # Use the WEIGHTS or fallback to length
        return WEIGHTS.get(pos, len(pos))