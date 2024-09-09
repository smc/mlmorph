""" Unittest class """
from __future__ import division, unicode_literals

import unittest

from mlmorph.spellchecker import SpellChecker


class SpellCheckerTests(unittest.TestCase):
    def test_correction(self):
        """ test spell checker corrections """
        spell = SpellChecker()
        self.assertTrue(spell.spellcheck("മലയാളം"))
        self.assertTrue(spell.spellcheck("മലയാളത്തിൽ"))
        self.assertTrue(spell.spellcheck("മലയാളത്തിലെ"))
        self.assertTrue(spell.spellcheck("മലയാളത്തിന്റെ"))
        self.assertTrue(spell.spellcheck("മലയാളത്തിനായി"))
        self.assertTrue(spell.spellcheck("ഇലക്ട്രിസിഫിക്കേഷൻ"))


    def test_mistake(self):
        """ test spell checker mistakes """
        spell = SpellChecker()
        self.assertFalse(spell.spellcheck("ദുഖം"))

    def test_candidates(self):
        """ test spell checker candidates """
        spell = SpellChecker()
        self.assertEqual(spell.candidates("ദുഖം"), ["ദുഃഖം"])
        self.assertEqual(spell.candidates("അങ്ങിനെ"), ["അങ്ങനെ"])
        self.assertEqual(spell.candidates("പീഢനം"), ["പീഡനം"])
        self.assertEqual(spell.candidates("യാദൃശ്ചികം"), ["യാദൃച്ഛികം"])
        self.assertEqual(spell.candidates("മതാധ്യക്ഷൻ"), [])


if __name__ == "__main__":
    unittest.main()
