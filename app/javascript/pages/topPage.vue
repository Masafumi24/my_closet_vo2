<template lang = "pug">
  .topPage
    Header
    .topPageImage
    .topPageChart
      .topPageChartLeft
        Chart
      .topPageChartRight
        Chart
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