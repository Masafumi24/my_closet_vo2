<template lang="pug">
  header.header
    a(href="#").headerLeftButton
      | MyCloset
    a(href="#").headerRightButton
      | menu
</template>

<script>
import MainSideBar from '../components/MainSidebar'

export default({
  components: {
    MainSideBar
  }
})
</script>