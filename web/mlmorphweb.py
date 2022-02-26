import regex
from flask import Flask, jsonify, request, send_from_directory

from mlmorph import Generator, Analyser, tokenize
from mlmorph_spellchecker import SpellChecker

app = Flask(__name__,
            static_folder="./public/",
            static_url_path='',
            template_folder="./public")

generator = Generator()
analyser = Analyser()
spellchecker = SpellChecker()


@app.route("/<path:path>", defaults={'path': 'index.html'})
def index(path):
    return send_from_directory('./public', path)


@app.route("/api/analyse", methods=['POST', 'GET'])
def do_analyse():
    text = None
    analyse_results = {}
    if request.method == 'POST':
        text = request.json.get('text')
    else:
        text = request.args.get('text')
    words = tokenize(text)
    # real analysis
    for windex in range(len(words)):
        word = words[windex]
        anals = analyser.analyse(word, False)
        anals_results = []
        if len(anals) == 0:
            anals_results = []
        else:
            for aindex in range(len(anals)):
                anals_results.append(analyser.parse_analysis(anals[aindex]))

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
    gens = generator.generate(genInput)
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
    words = tokenize(text)
    result = {}
    # real analysis
    for windex in range(len(words)):
        word = words[windex]
        isCorrect = spellchecker.spellcheck(word)
        suggestions = []
        if not isCorrect:
            suggestions = spellchecker.candidates(word)
        result[word] = {'correct': isCorrect, 'suggestions': suggestions}
    return jsonify(result)


if __name__ == "__main__":
    app.run()
