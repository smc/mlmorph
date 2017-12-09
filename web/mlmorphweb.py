import sys
import regex
import os
from flask import Flask, jsonify, render_template, request

os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')

from mlmorph import Mlmorph
app = Flask(__name__)
app.config['DEBUG'] = True

morph = Mlmorph('../malayalam.a')


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
    print(roots)
    for rindex in range(len(roots)):
        morpheme = {}
        print(roots[rindex])
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
def analyse():
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
        analyse_results[word] = anals_results
    return jsonify(result=analyse_results)


@app.route("/api/generate", methods=['GET'])
def generate():
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

if __name__ == "__main__":
    app.run()
