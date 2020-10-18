
from libhfst import HfstInputStream, HfstTransducer


def get_transducer(fsa: str) -> HfstTransducer:
    istr = HfstInputStream(fsa)
    transducers = []
    while not (istr.is_eof()):
        transducers.append(istr.read())
    istr.close()
    return transducers[0]
