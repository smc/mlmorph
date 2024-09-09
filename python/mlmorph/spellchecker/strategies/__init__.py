from .chillu_normalization import ChilluNormalization
from .chillu_to_virama_form import ChilluToConsonantVirama
from .consonant_virama_to_chillu import ConsonantViramaToChillu
from .geminate_consonants import GeminateConsonants
from .insert_y_before_kkuka import Ykkuka
from .mpa_correction import MpaCorrection
from .nta_correction import NtaCorrection
from .phonetic_similarity import PhoneticSimilarity
from .virama_insertion import ViramaInsertion
from .visual_similarity import VisualSimilarity
from .vowel_elongation import VowelElongation
from .vowel_shortening import VowelShortening

__all__ = [
    "ChilluNormalization",
    "ChilluToConsonantVirama",
    "ConsonantViramaToChillu",
    "GeminateConsonants",
    "Ykkuka",
    "MpaCorrection",
    "NtaCorrection",
    "PhoneticSimilarity",
    "ViramaInsertion",
    "VisualSimilarity",
    "VowelElongation",
    "VowelShortening",
]



