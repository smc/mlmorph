#!/usr/bin/env python

"""
Simple python interface for mlmorph using sfst
"""

import sfst
from pkg_resources import resource_filename, resource_exists
from typing import Tuple
from .normalizer import normalize
from .analyser import Analyser


class Generator:
    RESOURCE_PATH = 'data/malayalam.a'

    def __init__(self):
        """Construct Mlmorph Generator"""
        self.fsa: str = None
        if resource_exists(__name__, Generator.RESOURCE_PATH):
            self.fsa = resource_filename(__name__, Generator.RESOURCE_PATH)
        if not self.fsa:
            raise ValueError('Could not read the fsa.')
        sfst.init(self.fsa)

    @staticmethod
    def get_weight(generated_word: str, token: str) -> int:
        """
        Get the weight for the generated word.
        Uses the weight of input token as the base weight.

        Give priority for smaller words, collation order.
        """

        suffixes = ['ിൽ', 'ിലും', 'ന്റെ', 'ന്', 'നെ']
        token_weight = Analyser.parse_analysis(token)['weight']
        length = len(suffixes)
        weight = token_weight
        for i in range(length):
            if generated_word.endswith(suffixes[i]):
                return weight+i
        return weight+len(generated_word)

    def generate(self, token: str, weighted: bool = True) -> Tuple:
        """Perform a simple morphological generator lookup."""
        token = normalize(token)
        generated_results = sfst.generate(token)
        if not weighted:
            return generated_results

        processed_result = []
        for gindex in range(len(generated_results)):
            generated_result_weight = Generator.get_weight(
                generated_results[gindex], token)
            processed_result.append(
                (generated_results[gindex], generated_result_weight))
        return sorted(processed_result, key=lambda tup: tup[1])

