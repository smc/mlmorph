<template>
  <section>
    <form @submit.prevent="ner">
      <textarea class="ner-input" v-model="input" />
      <button class="ner-button" type="submit">Process</button>
    </form>
    <progress v-if="loading" />
    <section v-else class="ner-result">
      <div class="entity" :key="entity.title" v-for="entity in entities">
        <wiki-article language="ml" :article="entity.title">
        </wiki-article>
      </div>
    </section>
  </section>
</template>

<script>
import axios from "axios";
import { ref, onMounted } from "vue";


export default {
  name: "Ner",

  setup() {
    const input = ref(
      "കേരളത്തിന്റെ മധ്യഭാഗത്തായി സ്ഥിതി ചെയ്യുന്ന ഒരു ജില്ലയാണ് ഇടുക്കി. ആസ്ഥാനം പൈനാവ്. തൊടുപുഴ, കട്ടപ്പന, അടിമാലി നെടുംകണ്ടം, ഇടുക്കി എന്നിവയാണ് ജില്ലയിലെ മറ്റു പ്രധാന പട്ടണങ്ങൾ. 4358 ച.കി. വിസ്തീർണ്ണമുള്ള (ഇത് കേരള സംസ്ഥാനത്തിന്റെ 11 ശതമാനം വരും) ഇടുക്കി ജില്ലയാണ് കേരളത്തിലെ ഏറ്റവും വലിയ രണ്ടാമത്തെ ജില്ല (എറണാകുളം ജില്ല, കുട്ടമ്പുഴ പഞ്ചായത്ത് വേർപെടുത്തിയതിന് ശേഷം) (ഏറ്റവും വലിയ ജില്ല പാലക്കാട് ജില്ല). ഇടുക്കി ജില്ലയുടെ 50 ശതമാനത്തിലധികവും സംരക്ഷിത വനഭൂമിയാണ്. തീവണ്ടിപ്പാത ഇല്ലാത്ത കേരളത്തിലെ രണ്ടു ജില്ലകളിൽ ഒന്നാണ് ഇത് (മറ്റേത്) വയനാട്).രാജവാഴ്ച കാലത്ത് വേണാട് സമ്രാജ്യത്തിന്റെ ഭാഗമായിരുന്നു ഇടുക്കി. ദേവീകുളം, തൊടുപുഴ, ഉടുമ്പഞ്ചോല, പീരുമേട്, ഇടുക്കി എന്നിവയാണ് ജില്ലയിലെ താലൂക്കുകൾ. തൊടുപുഴയും കട്ടപ്പനയുമാണ് ജില്ലയിലെ മുനിസിപ്പാലിറ്റികൾ. 8 ബ്ലോക്ക് പഞ്ചായത്തുകളും 51 ഗ്രാമ പഞ്ചായത്തുകളും ഉണ്ട്. ഇത് കൂടാതെ, ഇടമലക്കുടി എന്ന കേരളത്തിലെ പ്രഥമ ആദിവാസി പഞ്ചായത്തായ ഇടമലക്കുടി 2010 നവംബർ ഒന്നിന് പ്രാബല്യത്തിൽ വന്നു. മൂന്നാർ പഞ്ചായത്തിന്റെ പതിമൂന്നാം വാർഡ് അടർത്തി മാറ്റിയാണ് ഇടമലക്കുടി രൂപീകരിക്കപ്പെട്ടത്. ദേവികുളം, അടിമാലി, നെടുങ്കണ്ടം, ഇളംദേശം, തൊടുപുഴ, ഇടുക്കി, കട്ടപ്പന, അഴുത എന്നിവയാണ് ബ്ലോക്ക് പഞ്ചായത്തുകൾ. "
    );
    const entities = ref([]);
    const loading = ref(false);

    const process = (result) => {
      const entities = {};
      let tokens = input.value.split(/\s+/);
      for (let i = 0; i < tokens.length; i++) {
        let key = tokens[i];
        let values = result[key];
        if (!values) continue;
        for (let i = 0; i < values.length; i++) {
          let entity = findEntity(values[i]);
          if (entity.length > 1) {
            entities[entity] = {};
          }
          // For now, take only first analysis
          if (i >= 1) break;
        }
      }
      return entities;
    };

    const getWikiInfo = (title) => {
      return axios
        .get(`https://ml.wikipedia.org/api/rest_v1/page/summary/${title}`)
        .then((res) => res.data);
    };

    const findEntity = (result) => {
      let morphemes = result.morphemes;
      for (let i = 0; i < morphemes.length; i++) {
        let morpheme = morphemes[i];
        let tags = morpheme.pos;
        if (tags[0] === "np" || tags[0] === "n") return morpheme.root;
      }
      return false;
    };

    const ner = () => {
      entities.value = [];
      const api = `/api/analyse`;
      loading.value = true;
      return axios
        .post(api, {
          text: input.value,
        })
        .then((response) => {
          const results = process(response.data.result);
          for (var entity in results) {
            getWikiInfo(entity)
              .then((pageInfo) => {
                if (
                  pageInfo.title &&
                  pageInfo.title.trim() &&
                  pageInfo.thumbnail
                )
                  entities.value.push(pageInfo);
                loading.value = false;
              })
              .catch((error) => {
                // eslint-disable-next-line no-console
                // pass if no wiki info found
              });
          }
        })
        .catch((error) => {
          // eslint-disable-next-line no-console
          console.log(error);
          loading.value = false;
        });
    };

    onMounted(() => {
      import('https://santhoshtr.github.io/wiki-elements/src/wiki-article.js').then((module) => {
        // use code
      })
    })

    return {
      loading,
      input,
      ner,
      entities,
    };
  },
};
</script>
<style>
.ner-input {
  padding: 0.5rem;
  font-size: 1rem;
  font-family: "Manjari", sans-serif;
  line-height: 1.4;
  width: 100%;
  height: 24ch;
  overflow: auto;
  border: 1px solid var(--vp-c-brand);
}

button.ner-button {
  padding: 0.5rem;
  margin: 0.5rem 0;
  background-color: var(--vp-c--c-brand);
  color: #fff;
  border: none;
}

form {
  margin: 1rem 0;
}

progress {
  width: 100%;
}

.ner-result {
  display: inline-flex;
  max-width: 100vw;
  flex-wrap: wrap;
}

.entity {
  margin: 1rem;
}

</style>
