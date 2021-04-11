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
        select(v-model="partsId").itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='parts in partsList' v-bind:value='parts.name' v-bind:key='parts.id')
            | {{ parts.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | ブランド
        select(v-model="selectedBrands" multiple).itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='brand in brands' v-bind:value='brand.name' v-bind:key='brand.id')
            | {{ brand.name }}
        font-awesome-icon(icon="plus-circle").itemsCreateBottomComponentIcon
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | ブランドを追加する
        input(v-model="newBrands").itemsCreateBottomComponentForm
        font-awesome-icon(icon="plus-circle").itemsCreateBottomComponentIcon
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 購入日
        input(type="date" v-model="date").itemsCreateBottomComponentSelect
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 購入場所
        select(v-model="selectedPrefecture").itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='prefecture in prefecture' v-bind:value='prefecture.name' v-bind:key='prefecture.id')
            | {{ prefecture.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 色
        select(v-model="selectedColors" multiple).itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='color in colors' v-bind:value='color.name' v-bind:key='color.id')
            | {{ color.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 季節
        select(v-model="selectedSeasons" multiple).itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='season in seasons' v-bind:value='season.name' v-bind:key='season.id')
            | {{ season.name }}
      a(href="#").itemsCreateBottomButton
        | 収納する
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        partsList: [
          {id: 1, name: "Tops"},
          {id: 2, name: "Outerwear"},
          {id: 3, name: "Pants or Skirt"},
          {id: 4, name: "Shoes"},
          {id: 5, name: "Accessory"},
          {id: 6, name: "Other"}
        ],
        partsId: null,
        brands: [],
        selectedBrands: [],
        newBrands: [],
        colors: [],
        selectedColors: [],
        seasons: [],
        selectedSeasons: [],
        prefecture: [],
        selectedPrefecture: null,
        date: null
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
        &Select {
          height: 2rem;
          width: 80%;
        }
        &Form {
          height: 2rem;
          width: 79%;
        }
        &Icon {
          margin-left: 1.5rem;
          height: 2rem;
          font-size: 1.2rem;
        }
      }
      &Button {
        display: block;
        margin: 4rem 0 0 24rem;
        width: 15%;
        padding: 0.5rem 3rem;
        text-align: center;
        color: #b1921b;
        border-right: 4px solid #cea82c;
        border-bottom: 10px solid #987c1e;
        border-left: 4px solid #ffed8b;
        border-radius: 0;
        background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
        background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
        background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
        text-shadow: -1px -1px 1px #ffffd9;
      }
    }
  }
</style>