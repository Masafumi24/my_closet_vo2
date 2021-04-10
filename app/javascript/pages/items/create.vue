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
          | 購入日
        select(v-model="selected").itemsCreateBottomComponentForm
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 購入場所
        select(v-model="selected").itemsCreateBottomComponentForm
      .itemsCreateBottomComponent
        .itemsCreateBottomComponentTitle
          | 色
        select(v-model="selectedColors" multiple).itemsCreateBottomComponentForm
          option(disabled value='') 選択して下さい
          option(v-for='color in colors' v-bind:value='color.name' v-bind:key='color.id')
            | {{ color.name }}
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        selectedColors: [],
        colors: []
      }
    },
    mounted () {
      axios
        .get('/api/colors')
        .then(response => (this.colors = response.data))
      console.log(this.colors)
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