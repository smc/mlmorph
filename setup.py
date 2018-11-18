from setuptools import setup
import os
import shutil

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
PACKAGENAME='mlmorph'

# Copy automata to data folder
shutil.copy(os.path.join(CURR_DIR,  'malayalam.a'), os.path.join(CURR_DIR, 'python', PACKAGENAME,'data/'))

setup()