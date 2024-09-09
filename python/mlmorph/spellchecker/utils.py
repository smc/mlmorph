import csv
import pkgutil

""" Additional utility functions """


def read_common_mistakes():
    """
    Read the common mistakes database

    Returns:
        Dict: Dict with keys as the words and value as correction
    """
    mistakes = {}
    mistakes_file = pkgutil.get_data(__name__, "resources/common_mistakes.csv")
    reader = csv.DictReader(mistakes_file.decode('utf-8').splitlines(), delimiter=",")
    for row in reader:
        mistakes[row['word']] = row['correct']
    return mistakes
