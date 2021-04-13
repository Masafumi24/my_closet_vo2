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
import Chart from '../components/Chart.vue'

export default({
  components: {
    Chart
  }
})
</script>