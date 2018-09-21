import sys
import regex
import os
from flask import Flask, jsonify, render_template, request

os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')
sys.path.insert(0, '../')

from mlmorph import Mlmorph
import spellcheck

app = Flask(__name__)

morph = Mlmorph('../malayalam.a')


@app.route("/")
def index():
    return render_template('mlmorph.html',)


@app.route("/spellchecker")
def spellchecker():
    return render_template('spellcheck.html',)


@app.route("/api/analyse", methods=['GET', 'POST'])
def do_analyse():
    text = None
    analyse_results = {}
    if request.method == 'POST':
        text = request.form['text']
    else:
        text = request.args.get('text')
    text = text.strip()
    words = regex.split(r'(\s+)', text)
    # real analysis
    for windex in range(len(words)):
        word = words[windex]
        anals = morph.analyse(word, False)
        anals_results = []
        if len(anals) == 0:
            anals_results = []
        else:
            for aindex in range(len(anals)):
                anals_results.append(morph.parse_analysis(anals[aindex]))

        anals_results.sort(key=lambda analysis: analysis['weight'])
        analyse_results[word] = anals_results

    return jsonify(result=analyse_results)


@app.route("/api/generate", methods=['GET'])
def do_generate():
    generate_results = []
    word = request.args.get('word')
    wordtype = request.args.get('type')
    genInput = word
    if wordtype:
        genInput += '<' + wordtype + '>'
    infl = request.args.get('infl')
    if infl:
        genInput += '<' + infl + '>'
    gens = morph.generate(genInput)
    if len(gens) == 0:
        generate_results.append(genInput)
    for gindex in range(len(gens)):
        generate_results.append(gens[gindex][0])
    return jsonify(word=word, type=wordtype, infl=infl, result=generate_results)


@app.route("/api/spellcheck", methods=['POST', 'GET'])
def do_spellcheck():
    result = {}
    if request.method == 'POST':
        text = request.json.get('text')
    else:
        text = request.args.get('text')
    text = text.strip()
    words = regex.split(r'(\s+)', text)
    result = {}
    # real analysis
    for windex in range(len(words)):
        word = words[windex]
        isCorrect = spellcheck.spellcheck(word, morph)
        suggestions = []
        if not isCorrect:
            suggestions = spellcheck.getSuggestions(word, morph)
        result[word] = {'correct': isCorrect, 'suggestions': suggestions}
    return jsonify(result)


if __name__ == "__main__":
    app.run()
