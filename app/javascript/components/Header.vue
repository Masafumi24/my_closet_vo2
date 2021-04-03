<template lang="pug">
  header.header
    a(href="#").headerLeftButton
      | MyCloset
    a.headerRightButton(@click='display("open")')
      | menu
    MainSideBar(v-if='isDisplay', @close='display("close")')
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
    display: function (action) {
      action === "open" ? this.isDisplay = true : this.isDisplay = false;
    }
  }
})
</script>