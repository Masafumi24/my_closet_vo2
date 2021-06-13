<template lang="pug">
  .itemsCreateBottomComponent
    .itemsCreateBottomComponentTitle
      | ブランド
    a
      .itemsCreateBottomComponentSelect(@click="viewPulldown")
        | 選択してください
    Pulldown(@select="addBrand" :lists="brands" v-if="showPulldown")
      
</template>

<script>
  import axios from 'axios';
  import Pulldown from '../Pulldown';
  
  export default {
    components: {
      Pulldown
    },
    data() {
      return {
        brands: [],
        selectedBrands: [],
        showPulldown: false
      }
    },
    mounted() {
      axios.get('/api/brands').then(response => (this.brands = response.data))
    },
    methods: {
      viewPulldown () {
        this.showPulldown ? this.showPulldown = false : this.showPulldown = true
      },
      addBrand (value) {
        !this.selectedBrands.includes(value) ? this.selectedBrands.push(value) : this.selectedBrands = this.selectedBrands.filter(id => id !== value)
        console.log(this.selectedBrands)
      }
    }
  }
</script>