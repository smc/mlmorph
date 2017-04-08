from datetime import datetime
from flask import Flask, abort, flash, jsonify, redirect, render_template, request, url_for
import sys
import re
import os

os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')

from mlmorph import Mlmorph
app = Flask(__name__)
app.config['DEBUG'] = True

morph = Mlmorph('../malayalam.a')

@app.route("/")
def index():
    return render_template('mlmorph.html',)

@app.route("/analyse", methods=['GET'])
def analyse():
    error = None
    text= None
    analyse_results = {}
    text = request.args.get('text')
    words = re.split('(\s+)', text )
    # real analysis
    for windex in range(len(words)):
        word = words[windex]
        anals =  morph.analyse(word)
        anals_results = []
        if len(anals) == 0:
            anals_results = []
        else:
            for aindex in range(len(anals)):
                anals_results.append( anals[aindex][0] )
        analyse_results[word] = anals_results
    return jsonify( result = analyse_results )

@app.route("/generate", methods=['GET'] )
def generate():
    genInput = None
    error = None
    word = None
    generate_results = []
    word = request.args.get('word')
    type = request.args.get('type')
    genInput = word
    if type:
        genInput += '<'+type+ '>'
    infl = request.args.get('infl')
    if infl:
        genInput += '<'+infl+ '>'
    gens =  morph.generate(genInput)
    if len(gens) == 0:
        generate_results.append( genInput )
    for gindex in range(len(gens)):
        generate_results.append( gens[gindex][0])
    return jsonify( word=word, type=type, infl=infl, result = generate_results )

if __name__ == "__main__":
    app.run()
