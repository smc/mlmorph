#!/usr/bin/env python

"""
Simple python interface for mlmorph using sfst
"""

from importlib import resources
from typing import List, Tuple

import regex
import sfst

from .foreign_word_detector import check_foreign_word
from .normalizer import normalize


class Analyser:

    ANALYSER_REGEX = regex.compile(r"((?P<root>([^<])+)(?P<tags>(<[^>]+>)+))+")
    POS_REGEX = regex.compile(r"(<(?P<tag>([^>]+))>)+")
    RESOURCE_PATH = "data/malayalam.a"

    def __init__(self):
        """Construct Mlmorph Analyser"""
        self.fsa: str = None
        if resources.files('mlmorph').joinpath(Analyser.RESOURCE_PATH).is_file():
            self.fsa: str = str(resources.files('mlmorph').joinpath(Analyser.RESOURCE_PATH))
        if not self.fsa:
            raise ValueError("Could not read the fsa.")
        sfst.init(self.fsa)


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
        word = normalize(word)
        analysis_results = sfst.analyse(word)
        if not len(analysis_results):
            if foreign_word_check and check_foreign_word(word):
                if weighted:
                    analysis_results = [word + "<fw>"]
                else:
                    analysis_results = [word + "<fw>"]

        if not weighted:
            return analysis_results

        processed_result = []
        for aindex in range(len(analysis_results)):
            weight = 0
            analysis = analysis_results[aindex]
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
            "fw": 1,
        }
        # Use the WEIGHTS or fallback to length
        return WEIGHTS.get(pos, len(pos))
