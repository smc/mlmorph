from datetime import datetime
from flask import Flask, abort, flash, redirect, render_template, request, url_for
import sys
import re
sys.path.insert(0, '../python')
from mlmorph import Mlmorph

app = Flask(__name__)
morph = Mlmorph('../malayalam.a')

@app.route("/")
def index():
    return render_template('mlmorph.html',)

@app.route("/analyse", methods=['GET', 'POST'])
def analyse():
    error = None
    text= None
    analyse_results = []
    if request.method == 'POST':
        text = request.form['text']
        words = re.split('(\s+)', text )
        # real analysis
        for windex in range(len(words)):
            word = words[windex]
            anals =  morph.analyse(word)
            if len(anals) == 0:
                analyse_results.append( word )
            for aindex in range(len(anals)):
                analyse_results.append( anals[aindex][0])
    return render_template('mlmorph.html', text=text, analyse_results=analyse_results)

@app.route("/generate", methods=['GET', 'POST'])
def generate():
    rror = None
    text= None
    generate_results = []
    if request.method == 'POST':
        word = request.form['word']
        gens =  morph.generate(word)
        if len(gens) == 0:
            generate_results.append( word )
        for gindex in range(len(gens)):
            generate_results.append( gens[gindex][0])
    return render_template('mlmorph.html', word=word, generate_results=generate_results)


if __name__ == "__main__":
    app.run()
