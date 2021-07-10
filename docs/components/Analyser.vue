<template>
    <section>
        <form @submit.prevent="analyse">
            <input class="analyser-input" v-model="input"/>
            <button class="analyser-analyse-button" type="submit">Analyse</button>
        </form>
        <progress v-if="loading"/>
        <section v-else class="analyser-result" >
        <ul>
        <li
            :key="word"
            v-for="(result, word) in analysis">
            <section class="analysis">
                <h4>{{ word }}</h4>
                <div class="analysis" :key="aindex"
                    v-for="(analysis, aindex) in result">
                     <div
                        class="morphemes" v-if="aindex == 0">
                     <div
                        class="morpheme"
                        :key="mindex"
                        v-for="(morpheme, mindex) in analysis.morphemes">
                        <div class="root">{{ morpheme.root }}</div>
                         <ul class="pos-tags">
                        <li
                            class="pos-tag"
                        v-for="(pos, posindex) in morpheme.pos"
                      :key="posindex"
                        v-text="getTag(pos).tag"
                      ></li>
                        </ul>
                    </div>
                    </div>
                </div>
            </section>
         </li>
        </ul>
        </section>
    </section>
</template>

<script>
import axios from "axios";
import tags from "../../tags.json";
import { ref } from "vue";

export default {
  name: "Analyser",

  setup() {
    const input=ref("ഇന്നലെയും മലപ്പുറത്ത് നല്ല മഴ പെയ്തിരുന്നു. കുട്ടികൾ സ്കൂളിൽ പോയില്ല");
    const analysis=ref({});
    const loading=ref(false);

    const getTag = (pos) => {
      return tags.find(item => item.id === pos) || { tag: pos };
    };

    const analyse = () => {
      const api = `/api/analyse`;
      const words = input.value.split(new RegExp(/\s/));
      analysis.value = {};
      loading.value = true;
      axios
        .post(api, {
          text: input.value
        })
        .then(response => {
          const results = response.data.result;
        const resultObj={}
          for (let i = 0; i < words.length; i++) {
           resultObj[words[i]] = results[words[i]];
          }
           analysis.value = resultObj;
          loading.value = false;
        })
        .catch(error => {
          // eslint-disable-next-line no-console
          console.log(error);
          loading.value = false;
        });
    }
    return {
        loading,
        input,
        getTag,
        analyse,
        analysis
    }
  }
};
</script>
<style>
.morphemes {
    display: inline-flex;
}

.morpheme {
    margin: 1rem 0.5rem;
    padding: 0;
    border: 1px solid var(--c-brand);
     border-radius: 2px;
}

.pos-tags {
    padding: 0;
}

.pos-tag {
    border: 1px solid var(--c-brand);
    border-left: 1px solid var(--c-brand);
    background-color: #f0f8ff;
    display: inline;
    padding: 0.25rem;
    margin: 0 4px;
    font-size: 0.8rem;
    font-family: monospace;
    border-radius: 4px;
}

.root {
    background-color:var(--c-brand-light);;
    padding: 0 0.5rem;
    font-weight: bold;
}

input.analyser-input {
    padding: 0.5rem;
    font-size: 1rem;
    width: 100%;
    border: 1px solid var(--c-brand);
}

button.analyser-analyse-button {
    padding: 0.5rem;
    margin: 0.5rem 0;
    background-color: var(--c-brand);
    color: #fff;
    border: none;
}

.analysis h4 {
     color: var(--c-brand);
}

form {
    margin: 1rem 0;
}

progress {
    width: 100%;
}
</style>