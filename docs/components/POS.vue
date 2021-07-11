<template>
  <table>
    <thead>
      <tr>
        <td>POS Tag</td>
        <td>Tag name</td>
        <td>Description</td>
      </tr>
    </thead>
    <tr class="pos" v-for="tag in tags" :key="tag.id">
      <td class="tag">{{ tag.id }}</td>
      <td class="tag-name">{{ tag.tag }}</td>
      <td class="tag-url"><a v-if="tag.url" :href="tag.url">Description</a></td>
    </tr>
  </table>
</template>

<script setup>
import tags from "../../tags.json";
</script>
<style>
.tag {
  font-family: monospace;
}

thead {
  font-weight: bold;
}
</style>
