var resultDictionary = {};
function doSpellcheck() {
	let editor = document.querySelector('.sp-editor');
	prepare(editor);
	process();
}

function prepare(editor) {
	editor.innerHTML = editor.innerText.replace(/(^|<\/?[^>]+>|\s+)([^\s<]+)/g, '$1<span class="word">$2</span>');
}

function checkWord(word) {
	return $.getJSON('/api/spellcheck', { word }, (data) => {
		resultDictionary[word].result = data;
	});
}

function addMenuItem(label) {
	var menuitem = document.createElement("menuitem");
	menuitem.label = label;
	document.querySelector("#suggestions").appendChild(menuitem);
}

function process() {
	let words = document.querySelectorAll(".word");
	let i = words.length;
	while (i--) {
		let word = words[i].innerText;
		resultDictionary[word] = { node: words[i] };
		checkWord(word).then(() => {
			if (resultDictionary[word].result.correct) {
				resultDictionary[word].node.classList.remove("error");
				return false;
			}
			resultDictionary[word].node.classList.add("error");
			resultDictionary[word].node.addEventListener(
				"contextmenu",
				onContextClick,
				false
			);
		});
	}
}

function onContextClick() {
	document.querySelector("#suggestions").innerHTML = "";
	let word = this.innerText;
	let suggestions = resultDictionary[word].result.suggestions;
	for (let i = 0; i < suggestions.length; i++) {
		addMenuItem(suggestions[i]);
	}
}