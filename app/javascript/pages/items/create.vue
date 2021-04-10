<template lang="pug">
  .itemsCreate
    .itemsCreateTopImage
      .itemsCreateTopImageText
        | 収納する
      .itemsCreateTopImageText
        | 〜 Store in the closet 〜
    .itemsCreateBottom
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 画像
        .itemsCreateBottomComponentImage
          input(type="file").itemsCreateBottomComponentImageFile
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 種別
        select(v-model="selected").itemsCreateBottomComponentForm
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | ブランド
        select(v-model="selectedBrands" multiple).itemsCreateBottomComponentForm
          option(disabled value='') 選択して下さい
          option(v-for='brand in brands' v-bind:value='brand.name' v-bind:key='brand.id')
            | {{ brand.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 購入日
        select(v-model="selected").itemsCreateBottomComponentForm
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 購入場所
        select(v-model="selectedPrefecture").itemsCreateBottomComponentForm
          option(disabled value='') 選択して下さい
          option(v-for='prefecture in prefecture' v-bind:value='prefecture.name' v-bind:key='prefecture.id')
            | {{ prefecture.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 色
        select(v-model="selectedColors" multiple).itemsCreateBottomComponentForm
          option(disabled value='') 選択して下さい
          option(v-for='color in colors' v-bind:value='color.name' v-bind:key='color.id')
            | {{ color.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 季節
        select(v-model="selectedSeasons" multiple).itemsCreateBottomComponentForm
          option(disabled value='') 選択して下さい
          option(v-for='season in seasons' v-bind:value='season.name' v-bind:key='season.id')
            | {{ season.name }}
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        brands: [],
        selectedBrands: [],
        colors: [],
        selectedColors: [],
        seasons: [],
        selectedSeasons: [],
        prefecture: [],
        selectedPrefecture: null
      }
    },
    mounted () {
      axios
        .get('/api/brands')
        .then(response => (this.brands = response.data))
      axios
        .get('/api/colors')
        .then(response => (this.colors = response.data))
      axios
        .get('/api/seasons')
        .then(response => (this.seasons = response.data))
      axios
        .get('/api/prefecture')
        .then(response => (this.prefecture = response.data))
    }
  }
</script>

<style lang="scss">
  .itemsCreate {
    background-color: rgba(184, 184, 184, 0.2);
    margin: 0 auto;
    width: 50%;
    &TopImage {
      box-sizing: border-box;
      padding: 2rem;
      // background-image: image-url("closet_new_header.jpg");
      // background-repeat: no-repeat;
      // background-position: top;
      // background-size: cover;
      height: 9rem;
      &Text {
        text-align: center;
      }
    }
    &Bottom {
      box-sizing: border-box;
      padding-left: 5rem;
      &Component {
        &Image {
          width: 80%;
          display: flex;
          justify-content: space-between;
        }
        &Title {
          padding: 1rem;
        }
        &Form {
          height: 2rem;
          width: 80%;
        }
      }
    }
  }
</style>