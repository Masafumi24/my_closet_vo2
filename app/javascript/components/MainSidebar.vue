<template lang="pug">
  .mainMenu
    .mainMenuSideBar
      .mainMenuSideBarTopContent
        a.mainMenuSideBarTopContentLogoutButton
          | ログアウト
        a.mainMenuSideBarTopContentCloseButton(@click='close')
          | ×
      ul.mainMenuSideBarBottomContent
        li.mainMenuSideBarBottomContentList
          a.mainMenuSideBarBottomContentListButton
            router-link(to='/items/create')| 収納する
        li.mainMenuSideBarBottomContentList
          a.mainMenuSideBarBottomContentListButton
            | クローゼットを見る
        li.mainMenuSideBarBottomContentList
          a.mainMenuSideBarBottomContentListButton
            | 検索する
        li.mainMenuSideBarBottomContentList
          a.mainMenuSideBarBottomContentListButton
            | 分析する
</template>

<script>
  export default({
    methods:{
      close: function(){
        this.$emit("close");
      }
    }
  })
</script>