Python Interface for Malayalam morphology analyser
==================================================
.. image:: https://img.shields.io/pypi/v/mlmorph.svg
    :target: https://pypi.python.org/pypi/mlmorph
    :alt: PyPI Version

This is python interface for the `Malayalam morphology analyser - mlmorph`_.

Installation
------------

Python 3 is required. Using with `venv`_ is recommended

  .. code-block:: console

    $ pip install mlmorph

Usage
-----

Morphological analysis example
-----------------------------------

  .. code-block:: python

    from mlmorph import Analyser
    analyser = Analyser()
    analyser.analyse("കേരളത്തിന്റെ")


Gives

  .. code-block:: python

    [('കേരളം<np><genitive>', 179)]


The second item in this result is the weight. Sometimes a single word can have multiple analysis. The analysis with less weight is the preferred analysis.

Morphological generator example
--------------------------------

  .. code-block:: python

    from mlmorph import Generator
    generator = Generator()
    generator.generate("കേരളം<np><genitive>")


Gives

  .. code-block:: python

    (('കേരളത്തിന്റെ', 0.0),)


Command line interface
--------------------------

  .. code-block:: console

    $ python -m mlmorph --help
    usage: __main__.py [-h] [-i INFILE] [-a] [-g] [-v]

    optional arguments:
      -h, --help            show this help message and exit
      -i INFILE, --input INFILE
                            source of analysis data
      -a, --analyse         Analyse the input file strings
      -g, --generate        Generate the input file strings
      -v, --verbose         print verbosely while processing


Accepts strings from stdin too. For example:

  .. code-block:: console

    $ python -m mlmorph -a
    നിറങ്ങൾ
    നിറങ്ങൾ   നിറം<n><pl>

.. _`Malayalam morphology analyser - mlmorph`: https://gitlab.com/smc/mlmorph
.. _`venv`: https://docs.python.org/3/library/venv.html