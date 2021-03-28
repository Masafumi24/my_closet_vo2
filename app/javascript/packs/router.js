import VueRouter from 'vue-router';

import TopPage from '../pages/topPage.vue'

const routes = [
  {path: '/', component: TopPage}
];

export default new VueRouter({ routes });