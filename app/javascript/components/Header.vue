<template lang="pug">
  header.header
    a(href="#").headerLeftButton
      | MyCloset
    a.headerRightButton(@click='display')
      | menu
    MainSideBar(v-if='isDisplay')
</template>

<script>
import MainSideBar from '../components/MainSidebar'

export default({
  components: {
    MainSideBar
  },
  data () {
    return {
      isDisplay: false
    }
  },
  methods: {
    display: function () {
      this.isDisplay = true;
    }
  }
})
</script>