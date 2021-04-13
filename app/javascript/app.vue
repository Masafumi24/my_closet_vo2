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

  import { library } from '@fortawesome/fontawesome-svg-core'
  import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
  import { fas } from '@fortawesome/free-solid-svg-icons'
  // import { fab } from '@fortawesome/free-brands-svg-icons'
  // import { far } from '@fortawesome/free-regular-svg-icons'
  library.add(fas)
  Vue.component('font-awesome-icon', FontAwesomeIcon)

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