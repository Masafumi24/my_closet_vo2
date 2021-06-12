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
          input(@change="fileSelect" type="file" name="file").itemsCreateBottomComponentImageFile
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 種別
        select(v-model="partsId").itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='parts in partsList' v-bind:value='parts.id' v-bind:key='parts.id')
            | {{ parts.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | ブランド
        select(v-model="selectedBrands" multiple).itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='brand in brands' v-bind:value='brand.id' v-bind:key='brand.id')
            | {{ brand.name }}
      AddBrandForm(@addBrandClick='addBrandField' v-for="index in brandTextFieldIndexLists" :key="index")
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 購入日
        input(type="date" v-model="purchase_date").itemsCreateBottomComponentSelect
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 購入場所
        select(v-model="selectedPrefecture").itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='prefecture in prefectureList' v-bind:value='prefecture.id' v-bind:key='prefecture.id')
            | {{ prefecture.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 色
        select(v-model="selectedColors" multiple).itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='color in colors' v-bind:value='color.id' v-bind:key='color.id')
            | {{ color.name }}
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 季節
        select(v-model="selectedSeasons" multiple).itemsCreateBottomComponentSelect
          option(disabled value='') 選択して下さい
          option(v-for='season in seasons' v-bind:value='season.id' v-bind:key='season.id')
            | {{ season.name }}
      a(@click="createItem").itemsCreateBottomButton
        | 収納する
</template>

<script>
  import axios from 'axios';
  import AddBrandForm from './add_brand_form.vue'

  export default {
    components: {
      AddBrandForm
    },
    data() {
      return {
        partsList: [
          {id: 1, name: "Tops"},
          {id: 2, name: "Outerwear"},
          {id: 3, name: "Pants or Skirt"},
          {id: 4, name: "Shoes"},
          {id: 5, name: "Accessory"},
          {id: 6, name: "Other"}
        ],
        image: null,
        partsId: null,
        brands: [],
        selectedBrands: [],
        colors: [],
        selectedColors: [],
        seasons: [],
        selectedSeasons: [],
        prefectureList: [],
        selectedPrefecture: null,
        purchase_date: null,
        brandTextFieldCurrentIndex: 0,
        brandTextFieldIndexLists: [0]
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
        .then(response => (this.prefectureList = response.data))
    },
    methods: {
      addBrandField(value) {
        this.brandTextFieldCurrentIndex += 1
        this.brandTextFieldIndexLists.push(this.brandTextFieldCurrentIndex)
      },
      fileSelect(e) {
        //選択したファイルの情報を取得しプロパティにいれる
        this.image = e.target.files[0];
      },
      createItem() {
        //formDataをnewする
        let formData = new FormData();
        formData.append('image', this.image);
        formData.append('purchase_date', this.purchase_date);
        formData.append('prefecture_id', this.selectedPrefecture);
        formData.append('parts_id', this.partsId);
        formData.append('color_ids', this.selectedColors);
        formData.append('season_ids', this.selectedSeasons);
        formData.append('brand_ids', this.selectedBrands);
        console.log(this.selectedColors)
        let config = {
          headers: {
            'content-type': 'multipart/form-data'
          }
        };
        axios
          .post('/api/items', formData, config)
      }
    }
  }
</script>