import pytest

from mlmorph import Analyser, Generator

analyser = Analyser()
generator = Generator()

tests = [
   (
        "കേരളത്തിന്റെ",
        "കേരളം<n><genitive>"
    ),
]


@pytest.mark.parametrize("word,analysis", tests)
def test_segment(word,analysis):
    assert analyser.analyse(word)[0][0] == analysis
    assert generator.generate(analysis)[0][0] == word

