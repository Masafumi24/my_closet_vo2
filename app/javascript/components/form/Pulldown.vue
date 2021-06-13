<template lang="pug">
  ul.pulldown
    a
      li.pulldownLists(:id="list.id" v-if="lists.length" v-for="list in lists" :key="list.id" @click="selectItem($event)") {{ list.name }}
      li.pulldownLists(v-else) 選択項目が追加されていません。
</template>

<script>
  export default {
    props: {
      lists: Array
    },
    methods: {
      selectItem(e) {
        this.$emit("select", e.target.id)
      }
    }
  }
</script>