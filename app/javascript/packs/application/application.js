import 'packs/lib/css'
import 'packs/lib/script'

import Vue from 'vue'
import HomePage from './pages/home.vue'
import Axios from 'axios'
import configureStore from './store'

document.addEventListener('DOMContentLoaded', () => {
  Vue.prototype.$http = Axios

  const store = configureStore(window.initialState)

  const app = new Vue({
    el: '#vue-home-page',
    store,
    render: h => h(HomePage)
  })
})
