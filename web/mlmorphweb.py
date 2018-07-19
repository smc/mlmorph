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
app.config['DEBUG'] = True

morph = Mlmorph('../malayalam.a')


def sort_key_analysis(item):
    morpheme_length = len(item['morphemes'])
    weight = morpheme_length*100
    for i in range(morpheme_length):
        weight += len(item['morphemes'][i]['pos'])
    return weight


def format_result(analysis_result):
    result = {}
    if analysis_result is None:
        return result

    result['weight'] = analysis_result[1]
    analysis = analysis_result[0]
    if analysis[0] == '<':
        analysis = ' ' + analysis
    match = regex.match(r"((?P<root>([^<])+)(?P<tags>(<[^>]+>)+))+", analysis)
    roots = match.captures("root")
    morphemes = []
    for rindex in range(len(roots)):
        morpheme = {}
        morpheme['root'] = roots[rindex]
        tags = match.captures("tags")[rindex]
        morpheme['pos'] = regex.match(
            r"(<(?P<tag>([^>]+))>)+", tags).captures("tag")
        morphemes.append(morpheme)

    result['morphemes'] = morphemes

    return result


@app.route("/")
def index():
    return render_template('mlmorph.html',)


@app.route("/api/analyse", methods=['GET', 'POST'])
def do_analyse():
    text = None
    analyse_results = {}
    if request.method == 'POST':
        text = request.form['text']
    else:
        text = request.args.get('text')
    words = regex.split(r'(\s+)', text)
    # real analysis
    for windex in range(len(words)):
        word = words[windex]
        anals = morph.analyse(word)
        anals_results = []
        if len(anals) == 0:
            anals_results = []
        else:
            for aindex in range(len(anals)):
                anals_results.append(format_result(anals[aindex]))

        anals_results.sort(key=sort_key_analysis)
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


@app.route("/api/spellcheck", methods=['GET'])
def do_spellcheck():
    word = request.args.get('word')
    isCorrect = spellcheck.spellcheck(word, morph)
    suggestions = []
    if not isCorrect:
        suggestions = spellcheck.getSuggestions(word, morph)
    return jsonify(word=word, correct=isCorrect, suggestions=suggestions)


if __name__ == "__main__":
    app.run()
