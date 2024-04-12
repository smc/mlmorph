<template>
    <section>
        <form @submit.prevent="generate">
            <input class="generator-input" v-model="input"/>
            <button class="generator-generate-button" type="submit">Generate</button>
        </form>
        <progress v-if="loading"/>
        <section v-else class="generator-result" >
        <h3 v-if="results?.length">{{ results[0] }}</h3>
        </section>
    </section>
</template>

<script>
import axios from "axios";
import { ref } from "vue";

export default {
  name: "Generator",

  setup() {
    const input=ref("പഞ്ചസാര<n><adj>മണൽ<n><adj>തരി<n><pl><locative>ഉം<cnj>ആണ്<aff>");
    const results=ref('');
    const loading=ref(false);

    const generate = () => {
      const api = `/api/generate?word=${input.value}`;
      loading.value = true;
      axios
        .get(api, {
          text: input.value
        })
        .then(response => {
          results.value = response.data.result;
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
        generate,
        results
    }
  }
};
</script>
<style>

input.generator-input {
    padding: 0.5rem;
    font-size: 1rem;
    width: 100%;
    border: 1px solid var(--vp-c-brand);
}

button.generator-generate-button {
    padding: 0.5rem;
    margin: 0.5rem 0;
    background-color: var(--vp-c-brand);
    color: #fff;
    border: none;
}

form {
    margin: 1rem 0;
}

progress {
    width: 100%;
}
</style>