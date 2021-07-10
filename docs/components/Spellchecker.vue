<template>
    <section>
      <editor
        tinymce-script-src="/assets/js/tinymce/tinymce.min.js"
        :initial-value="input"
        :init="editorConfig"
      ></editor>
    </section>
</template>

<script>
import axios from "axios";
import { ref, computed } from "vue";
import Editor from "@tinymce/tinymce-vue";

export default {
  name: "Spellchecker",
  components: {
    Editor
  },
  setup() {
    const input=ref("കേരളത്തിന് വേൺട വൈദ്യുതിയുടെ 66 ശതമാനവും ഇഡുക്കി ജില്ലയിലെ ജലവൈദ്യുത പദ്ധതികളിൽ നിന്നാണ് ലബിക്കുന്നത്.  ഏഷ്യയിലെ ഏറ്റവും വലിയ അണക്കെട്ടുകളിൽ ഒന്നാണ്. ഇതു ഇന്ത്യയിലെ രണ്ടാമത്തെ ഏററവും ഉയരം കൂടിയ അണക്കെട്ടാണ്. കേരളത്തിലെ ഏറ്റവും വലിയ ജലവൈദ്യുതപദ്ധതിയും ഇതാണ്. വിനോധസഞ്ചാരമേഖലയാണ് എടുത്തു പറയേണ്ട മറ്റൊരു സവിശേഷത.");
    const dictionary = ref([]);

    const editorConfig = computed(() => ({
        height: 500,
        menubar: true,
        toolbar_mode: "sliding",
        toolbar_sticky: true,
        mobile: {
          menubar: true
        },
        plugins: [
          "advlist autolink lists link image charmap print preview anchor",
          "searchreplace visualblocks code fullscreen",
          "insertdatetime media table paste code help wordcount spellchecker"
        ],
        spellchecker_languages: "Malayalam=ml",
        toolbar:
          "spellchecker | undo  redo | formatselect | fontselect | bold italic underline strikethrough codeformat | backcolor forecolor | alignleft aligncenter  alignright alignjustify | bullist numlist outdent indent | removeformat| help",
        font_formats:
          "മഞ്ജരി=Manjari,helvetica,sans-serif; ഗായത്രി=Gayathri,helvetica,sans-serif; ചിലങ്ക=Chilanka,serif; രചന=Rachana,serif; മീര=Meera,sans-serif; കേരളീയം=Keraleeyam, sans-serif; ഉറൂബ്=Uroob, sans-serif;",
        spellchecker_callback: spellcheck
     }));


    const spellcheck = (method, text, success, failure)=> {
      const api = `/api/spellcheck`;
      if (method === "spellcheck") {
        axios
          .post(api, {
            text: text
          })
          .then(response => {
            const results = response.data;
            const misspellings = {};
            Object.keys(results).forEach(word => {
              if (word.trim() && !results[word].correct) {
                misspellings[word] = results[word].suggestions;
              }
            });
            success({ words: misspellings, dictionary: dictionary.value });
          })
          .catch(error => {
            // eslint-disable-next-line no-console
            console.log(error);
            failure("Spellcheck error:" + error);
          });
      } else if (method === "addToDictionary") {
        this.dictionary.push(text);
        success();
      }
    }
    return {
        editorConfig,
        input,
        spellcheck,
    }
  }
};
</script>
