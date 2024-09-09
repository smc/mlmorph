import regex
from fastapi import FastAPI, Request
from fastapi.responses import FileResponse, JSONResponse
from mlmorph import Generator, Analyser
from mlmorph.spellchecker import SpellChecker
from fastapi.staticfiles import StaticFiles
import uvicorn

app = FastAPI()


generator = Generator()
analyser = Analyser()
spellchecker = SpellChecker()


@app.get("/api/analyse")
@app.post("/api/analyse")
async def do_analyse(request: Request):
    text = (
        (await request.json()).get("text")
        if request.method == "POST"
        else request.query_params.get("text", "")
    )

    text = text.strip()
    words = regex.split(r'(\s+)', text)
    analyse_results = {}
    for word in words:
        anals = analyser.analyse(word, False)
        anals_results = []
        if len(anals) == 0:
            anals_results = []
        else:
            for aindex in range(len(anals)):
                anals_results.append(analyser.parse_analysis(anals[aindex]))

        anals_results.sort(key=lambda analysis: analysis['weight'])
        analyse_results[word] = anals_results

    return JSONResponse(content={"result": analyse_results})


@app.get("/api/generate")
async def do_generate(word: str, wordtype: str = "", infl: str = ""):
    generate_results = []
    genInput = word
    if wordtype:
        genInput += "<" + wordtype + ">"
    if infl:
        genInput += '<' + infl + '>'
    gens = generator.generate(genInput)
    if len(gens) == 0:
        generate_results.append(genInput)
    for gindex in range(len(gens)):
        generate_results.append(gens[gindex][0])
    return JSONResponse(
        content={
            "word": word,
            "type": wordtype,
            "infl": infl,
            "result": generate_results,
        }
    )


@app.get("/api/spellcheck")
@app.post("/api/spellcheck")
async def do_spellcheck(request: Request):
    text = (
        (await request.json()).get("text")
        if request.method == "POST"
        else request.query_params.get("text", "")
    )
    text = text.strip()
    words = regex.split(r'(\s+)', text)
    result = {}
    for word in words:
        isCorrect = spellchecker.spellcheck(word)
        suggestions = []
        if not isCorrect:
            suggestions = spellchecker.candidates(word)
        result[word] = {'correct': isCorrect, 'suggestions': suggestions}
    return JSONResponse(content=result)


app.mount("/", StaticFiles(directory="public", html=True), name="static")


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
