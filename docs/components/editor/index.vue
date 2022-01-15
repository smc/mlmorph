<template>
  <div class="editor" v-if="editor">
    <menu-bar class="editor__header" :editor="editor" />
    <editor-content class="editor__content" :editor="editor" />
    <ul id="spellcheck-suggestions" class="contextmenu"></ul>
  </div>
</template>

<script setup>
import { useEditor, EditorContent } from "@tiptap/vue-3";
import StarterKit from "@tiptap/starter-kit";
import MenuBar from "./MenuBar.vue";
import TaskList from "@tiptap/extension-task-list";
import TaskItem from "@tiptap/extension-task-item";
import Highlight from "@tiptap/extension-highlight";
import CharacterCount from "@tiptap/extension-character-count";
import { Spellchecker } from "./SpellcheckerExtension";

const editor = useEditor({
  content:
    "<p>കേരളത്തിന് വേൺട വൈദ്യുതിയുടെ 66 ശതമാനവും ഇഡുക്കി ജില്ലയിലെ ജലവൈദ്യുത പദ്ധതികളിൽ നിന്നാണ് ലബിക്കുന്നത്. ഏഷ്യയിലെ ഏറ്റവും വലിയ അണക്കെട്ടുകളിൽ ഒന്നാണ്. ഇതു ഇന്ത്യയിലെ രണ്ടാമത്തെ ഏററവും ഉയരം കൂടിയ അണക്കെട്ടാണ്. കേരളത്തിലെ ഏറ്റവും വലിയ ജലവൈദ്യുതപദ്ധതിയും ഇതാണ്. വിനോധസഞ്ചാരമേഖലയാണ് എടുത്തു പറയേണ്ട മറ്റൊരു സവിശേഷത.</p>",
  components: {
    EditorContent,
    MenuBar,
  },
  extensions: [
    StarterKit,
    Highlight,
    TaskList,
    CharacterCount,
    Spellchecker,
    TaskItem,
  ],
});
</script>

<style lang="scss">
.editor {
  display: flex;
  flex-direction: column;
  min-height: 40ch;
  max-height: 80vh;
  color: #0d0d0d;
  background-color: #fff;
  border: 1px solid #eee;
  border-radius: 2px;

  &__header {
    display: flex;
    align-items: center;
    flex: 0 0 auto;
    flex-wrap: wrap;
    padding: 0.25rem;
    border-bottom: 1px solid #eee;
    background-color: #fff;
  }

  &__content {
    padding: 1.25rem 1rem;
    flex: 1 1 auto;
    overflow-x: hidden;
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
  }

  &__footer {
    display: flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    white-space: nowrap;
    border-top: 3px solid #0d0d0d;
    font-size: 12px;
    font-weight: 600;
    color: #0d0d0d;
    white-space: nowrap;
    padding: 0.25rem 0.75rem;
  }

  /* Some information about the status */
  &__status {
    display: flex;
    align-items: center;
    border-radius: 5px;

    &::before {
      content: " ";
      flex: 0 0 auto;
      display: inline-block;
      width: 0.5rem;
      height: 0.5rem;
      background: rgba(#0d0d0d, 0.5);
      border-radius: 50%;
      margin-right: 0.5rem;
    }

    &--connecting::before {
      background: #616161;
    }

    &--connected::before {
      background: #b9f18d;
    }
  }

  &__name {
    button {
      background: none;
      border: none;
      font: inherit;
      font-size: 12px;
      font-weight: 600;
      color: #0d0d0d;
      border-radius: 0.4rem;
      padding: 0.25rem 0.5rem;

      &:hover {
        color: #fff;
        background-color: #0d0d0d;
      }
    }
  }
}


/* Basic editor styles */
.ProseMirror {
  outline: none;
  > * + * {
    margin-top: 0.75em;
  }

  ul,
  ol {
    padding: 0 1rem;
  }

  h1,
  h2,
  h3,
  h4,
  h5,
  h6 {
    line-height: 1.1;
  }

  code {
    background-color: rgba(#616161, 0.1);
    color: #616161;
  }

  pre {
    background: #0d0d0d;
    color: #fff;
    font-family: "JetBrainsMono", monospace;
    padding: 0.75rem 1rem;
    border-radius: 0.5rem;

    code {
      color: inherit;
      padding: 0;
      background: none;
      font-size: 0.8rem;
    }
  }

  mark {
    background-color: #faf594;
  }

  img {
    max-width: 100%;
    height: auto;
  }

  hr {
    margin: 1rem 0;
  }

  blockquote {
    padding-left: 1rem;
    border-left: 2px solid rgba(#0d0d0d, 0.1);
  }

  hr {
    border: none;
    border-top: 2px solid rgba(#0d0d0d, 0.1);
    margin: 2rem 0;
  }

  ul[data-type="taskList"] {
    list-style: none;
    padding: 0;

    li {
      display: flex;
      align-items: center;

      > label {
        flex: 0 0 auto;
        margin-right: 0.5rem;
        user-select: none;
      }

      > div {
        flex: 1 1 auto;
      }
    }
  }

  .spellingmistake {
    background: #fdd;
    border-bottom: 1px solid #f22;
    margin-bottom: -1px;
  }
  .lint-icon {
    display: inline-block;
    position: absolute;
    right: 2px;
    cursor: pointer;
    border-radius: 100px;
    background: #f22;
    color: white;
    font-family: times, georgia, serif;
    font-size: 15px;
    font-weight: bold;
    width: 1.1em;
    height: 1.1em;
    text-align: center;
    padding-left: 0.5px;
    line-height: 1.1em;
  }
  .lint-icon:before {
    content: "!";
  }
}
.contextmenu {
  display: none;
  z-index: 1000;
  position: fixed;
  box-shadow: 0 3px 6px 0 rgba(51, 51, 51, 0.2);
  border-radius: 4px;
  padding: 4px 0;
  background-color: #fff;
  margin: 0;
  list-style-type: none;
  list-style: none;
  li {
    display: flex;
    color: #333;
    cursor: pointer;
    padding: 5px 15px;
    align-items: center;
  }
  li.suggestion:hover{
    background-color: #409eff;
    color: #fff;
  }
}
.contextmenu.show {
  display: block;
}
</style>
