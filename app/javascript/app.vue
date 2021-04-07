<template lang="pug">
  #app
    Header
    router-view
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'

  import TopPage from './pages/topPage.vue'
  import CreateItem from './pages/items/create.vue'

  import Header from './components/Header.vue'

  const router = new VueRouter({
    routes: [
      {path: '/', component: TopPage},
      {path: '/items/create', component: CreateItem}
    ]
  })

  Vue.use(VueRouter)

  export default({ 
    router,
    components: {
      Header
    }
  });
</script>