<template lang="pug">
  .itemsCreateBottomComponent
    .itemsCreateBottomComponentTitle
      | ブランドを追加する
    input(v-model="newBrands").itemsCreateBottomComponentForm
    a
      font-awesome-icon(icon="plus-circle" @click="addBrandTextField").itemsCreateBottomComponentIcon
</template>

<script>
  export default {
    data() {
      return {
        newBrands: []
      }
    },
    methods: {
      addBrandTextField() {
        this.selfIndex += 1
        this.$emit("addBrandClick")
      }
    }
  }
</script>