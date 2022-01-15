import { Extension } from '@tiptap/core'
import { Plugin } from 'prosemirror-state'
import { Decoration, DecorationSet } from "prosemirror-view";
import { TextSelection } from "prosemirror-state";
import axios from "axios";

const wordsRegex = /[a-zA-Z\u0D00-\u0D7F]+/gi;

function debounce(func, timeout = 100) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      func.apply(this, args);
    }, timeout);
  };
}

function fixSpelling(replacement) {
  return function ({ state, dispatch }) {
    dispatch(state.tr.replaceWith(this.from, this.to,
      state.schema.text(replacement)))
  }
}

const spellcheck = (text) => {
  const misspellings = {};
  const api = `https://morph.smc.org.in/api/spellcheck`;
  return axios
    .post(api, { text: text })
    .then((response) => {
      const results = response.data;

      Object.keys(results).forEach((word) => {
        if (word.trim() && !results[word].correct) {
          misspellings[word] = results[word].suggestions || [];
        }
      });
      return misspellings;
    })
    .catch((error) => {
      // eslint-disable-next-line no-console
      console.log(error);
    });
};

function checkNodes(node, pos) {
  let result = [];
  // For each node in the document
  if (node.isText) {
    // Scan text nodes for suspicious patterns
    let m;

    let words = node.text.split(" ");
    let misspellings = {};
    return spellcheck(node.text).then((misspellings) => {
      while ((m = wordsRegex.exec(node.text))) {
        let word = m[0];
        if (misspellings[word]) {
          result.push({
            msg: `${m[0]}->${misspellings[word][0]}`,
            from: pos + m.index,
            to: pos + m.index + m[0].length,
            fix: fixSpelling(misspellings[word][0]),
            suggestions: misspellings[word],
          });
        }
      }
      return result;
    });
  }

  return Promise.resolve(result);
}

function spellcheckDeco(view) {
  let state = view.state;
  state.tr.doc.descendants((node, pos) => {
    checkNodes(node, pos).then((probs) => {
      let decos = [];
      probs.forEach((prob) => {
        decos.push(
          Decoration.inline(prob.from, prob.to, {
            class: "spellingmistake",
            suggestions: prob.suggestions,
          }),
        );
      });
      view.dispatch(state.tr.setMeta("spellchecks", decos));
    });
  });
}

function showSuggestions(view, event){
  let pos = view.posAtCoords({ left: event.clientX, top: event.clientY });
  if (!pos) {
    return;
  }
  pos = pos.pos;
  const decos = this.getState(view.state);
  const deco = decos.find(pos, pos)[0];
  if (!deco) {
    return false;
  }
  const contextMenu = document.getElementById("spellcheck-suggestions");
  const { clientX: mouseX, clientY: mouseY } = event;
  contextMenu.style.top = `${mouseY}px`;
  contextMenu.style.left = `${mouseX}px`;
  contextMenu.classList.add("show");
  const suggestions = deco.type.attrs.suggestions;

  while (contextMenu.firstChild) {
    contextMenu.removeChild(contextMenu.firstChild);
  }

  for (let i = 0; i < suggestions.length; i++) {
    const suggestionEl = document.createElement("li");
    suggestionEl.innerText = suggestions[i];
    suggestionEl.classList.add("suggestion");
    suggestionEl.addEventListener("click", () => {
      view.dispatch(view.state.tr.replaceWith(deco.from, deco.to,
        view.state.schema.text(suggestions[i])))
      contextMenu.classList.remove("show");
    });

    contextMenu.append(suggestionEl);
  }

  if (!suggestions || !suggestions.length) {
    const suggestionEl = document.createElement("li");
    suggestionEl.innerText = "No suggestions";
    contextMenu.append(suggestionEl);
  }
  contextMenu.addEventListener("blur", () => {
    contextMenu.classList.remove("show");
  })
  event.preventDefault();
  return true;
}

export const Spellchecker = Extension.create({
  name: 'spellchecker',

  addProseMirrorPlugins() {
    return [
      new Plugin({
        state: {
          init(_, { doc }) {
            return DecorationSet.empty;
          },
          apply(tr, old, oldState, state) {
            const spellchecks = tr.getMeta("spellchecks");
            if (spellchecks && spellchecks.length) {
              return DecorationSet.create(tr.doc, spellchecks);
            }

            return old;
          },
        },
        view: (view) => {
          return {
            update: debounce((view, lastState) => {
              let state = view.state;
              // Don't do anything if the document/selection didn't change
              if (lastState && lastState.doc.eq(state.doc)) return;
              spellcheckDeco(view);
            }),
          };
        },
        props: {
          decorations(state) {
            return this.getState(state);
          },
          handleClick(view, _, event) {
            if (/spellingmistake/.test(event.target.className)) {
              return;
            }
            const contextMenu = document.getElementById("spellcheck-suggestions");
            if(contextMenu){
              contextMenu.classList.remove("show");
            }
          },
          handleDOMEvents: {
            contextmenu(view, event) {
              let pos = view.posAtCoords({ left: event.clientX, top: event.clientY });
              if (!pos) {
                return;
              }
              pos = pos.pos;
              const decos = this.getState(view.state);
              const deco = decos.find(pos, pos)[0];
              if (!deco) {
                return false;
              }
              const contextMenu = document.getElementById("spellcheck-suggestions");
              const { clientX: mouseX, clientY: mouseY } = event;
              contextMenu.style.top = `${mouseY}px`;
              contextMenu.style.left = `${mouseX}px`;
              contextMenu.classList.add("show");
              const suggestions = deco.type.attrs.suggestions;

              while (contextMenu.firstChild) {
                contextMenu.removeChild(contextMenu.firstChild);
              }

              for (let i = 0; i < suggestions.length; i++) {
                const suggestionEl = document.createElement("li");
                suggestionEl.innerText = suggestions[i];
                suggestionEl.classList.add("suggestion");
                suggestionEl.addEventListener("click", () => {
                  view.dispatch(view.state.tr.replaceWith(deco.from, deco.to,
                    view.state.schema.text(suggestions[i])))
                  contextMenu.classList.remove("show");
                });

                contextMenu.append(suggestionEl);
              }

              if (!suggestions || !suggestions.length) {
                const suggestionEl = document.createElement("li");
                suggestionEl.innerText = "No suggestions";
                contextMenu.append(suggestionEl);
              }
              contextMenu.addEventListener("blur", () => {
                contextMenu.classList.remove("show");
              })
              event.preventDefault();
              return true;
            },
          },
        },
      }),
    ]
  },
})

