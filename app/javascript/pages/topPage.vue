<template lang = "pug">
  .topPage
    Header
    .topPageImage
    .topPagechart
      .topPagechartLeft
        Chart
      .topPagechartRight
</template>

<script>
import Header from '../components/Header.vue'
import Chart from '../components/Chart.vue'

export default({
  components: {
    Header,
    Chart
  }
})
</script>