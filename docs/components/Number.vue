<template>
  <section>
    <form>
      <input type="number" class="number-input" v-model="input"
      placeholder="Enter a number" @input="onChange" />
     </form>
    <progress v-if="loading" />
    <section v-else class="number-result">
        <h3 class="primary">{{ result && result[0] }}    </h3>
        <h3 class="alternate" v-if="result && result.length>0">{{ result && result[1] }} </h3>
        <h3 class="alternate" v-if="result && result.length>1">{{ result && result[2] }} </h3>
    </section>
  </section>
</template>

<script>
import axios from "axios";
import { ref } from "vue";

const onesStr = [
  "പൂജ്യം",
  "ഒന്ന്",
  "രണ്ട്",
  "മൂന്ന്",
  "നാല്",
  "അഞ്ച്",
  "ആറ്",
  "ഏഴ്",
  "എട്ട്",
  "ഒമ്പത്"
];

 const clean = (result) => {
      result = result.replace("<ones><hundreds>", "<hundreds>");
      result = result.replace("<ones><tens>", "<tens>");
      result = result.replace("ഒന്ന്<ones><hundredsa>", "<hundreds>");
      result = result.replace("ഒന്ന്<ones><thousands>", "<thousands>");
      return result;
};

const positionValues = (value)  => {
      let result = "";
      let crores = value >= 10000000 ? parseInt(value / 10000000) : 0;
      let lakhs = parseInt((value % 10000000) / 100000);
      let thousands = parseInt((value % 100000) / 1000);
      let hundreds = parseInt((value % 1000) / 100);
      let tens = parseInt((value % 100) / 10);
      let ones = parseInt((value % 10) / 1);
      result =
        (crores > 0 ? positionValues(crores) + "<crores>" : "") +
        (lakhs > 0 ? positionValues(lakhs) + "<lakhs>" : "") +
        (thousands > 0 ? positionValues(thousands) + "<thousands>" : "") +
        (hundreds > 0 ? positionValues(hundreds) + "<hundreds>" : "") +
        (tens > 0 ? positionValues(tens) + "<tens>" : "") +
        (ones > 0 ? onesStr[ones] + "<ones>" : "") +
        (value === 0 ? onesStr[ones] + "<zero>" : "");

      return clean(result);
};

export default {
  name: "NumberSpellout",

  setup() {
    const input = ref(
      "കേരളത്തിന്റെ മധ്യഭാഗത്തായി സ്ഥിതി ചെയ്യുന്ന ഒരു ജില്ലയാണ് ഇടുക്കി. ആസ്ഥാനം പൈനാവ്. തൊടുപുഴ, കട്ടപ്പന, അടിമാലി നെടുംകണ്ടം, ഇടുക്കി എന്നിവയാണ് ജില്ലയിലെ മറ്റു പ്രധാന പട്ടണങ്ങൾ. 4358 ച.കി. വിസ്തീർണ്ണമുള്ള (ഇത് കേരള സംസ്ഥാനത്തിന്റെ 11 ശതമാനം വരും) ഇടുക്കി ജില്ലയാണ് കേരളത്തിലെ ഏറ്റവും വലിയ രണ്ടാമത്തെ ജില്ല (എറണാകുളം ജില്ല, കുട്ടമ്പുഴ പഞ്ചായത്ത് വേർപെടുത്തിയതിന് ശേഷം) (ഏറ്റവും വലിയ ജില്ല പാലക്കാട് ജില്ല). ഇടുക്കി ജില്ലയുടെ 50 ശതമാനത്തിലധികവും സംരക്ഷിത വനഭൂമിയാണ്. തീവണ്ടിപ്പാത ഇല്ലാത്ത കേരളത്തിലെ രണ്ടു ജില്ലകളിൽ ഒന്നാണ് ഇത് (മറ്റേത്) വയനാട്).രാജവാഴ്ച കാലത്ത് വേണാട് സമ്രാജ്യത്തിന്റെ ഭാഗമായിരുന്നു ഇടുക്കി. ദേവീകുളം, തൊടുപുഴ, ഉടുമ്പഞ്ചോല, പീരുമേട്, ഇടുക്കി എന്നിവയാണ് ജില്ലയിലെ താലൂക്കുകൾ. തൊടുപുഴയും കട്ടപ്പനയുമാണ് ജില്ലയിലെ മുനിസിപ്പാലിറ്റികൾ. 8 ബ്ലോക്ക് പഞ്ചായത്തുകളും 51 ഗ്രാമ പഞ്ചായത്തുകളും ഉണ്ട്. ഇത് കൂടാതെ, ഇടമലക്കുടി എന്ന കേരളത്തിലെ പ്രഥമ ആദിവാസി പഞ്ചായത്തായ ഇടമലക്കുടി 2010 നവംബർ ഒന്നിന് പ്രാബല്യത്തിൽ വന്നു. മൂന്നാർ പഞ്ചായത്തിന്റെ പതിമൂന്നാം വാർഡ് അടർത്തി മാറ്റിയാണ് ഇടമലക്കുടി രൂപീകരിക്കപ്പെട്ടത്. ദേവികുളം, അടിമാലി, നെടുങ്കണ്ടം, ഇളംദേശം, തൊടുപുഴ, ഇടുക്കി, കട്ടപ്പന, അഴുത എന്നിവയാണ് ബ്ലോക്ക് പഞ്ചായത്തുകൾ. "
    );
    const result = ref("");
    const loading = ref(false);

    const onChange = () => {
      let numberMorphemes =
        positionValues(Number(input.value)) + "<cardinal>";
      spellout(numberMorphemes);
    };

    const spellout = (numberMorphemes) => {
      const api = `/api/generate?word=${numberMorphemes}`;
      loading.value = true;
      axios
        .get(api)
        .then(response => {
          loading.value = false;
          result.value = response.data.result;
        })
        .catch(error => {
          // eslint-disable-next-line no-console
          console.log(error);
          loading.value = false;
        });
    };

    return {
      loading,
      input,
      onChange,
      result,
    };
  },
};
</script>
<style>
.number-input {
  padding: 0.5rem;
  font-size: 1rem;
  font-family: "Manjari", sans-serif;
  line-height: 1.4;
  width: 100%;
  overflow: auto;
  border: 1px solid var(--c-brand);
}

progress {
  width: 100%;
}

.number-result .primary{
 color: var(--c-brand);
}

.number-result .alternate {
  color: var(--c-text-light-2);
}

</style>
