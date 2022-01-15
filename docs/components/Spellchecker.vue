<template>
    <section>
      <editor/>
    </section>
</template>

<script>
import axios from "axios";
import { ref, computed } from "vue";
import Editor from './editor/index.vue'

export default {
  name: "Spellchecker",
  components: {
    Editor
  }
};
</script>
