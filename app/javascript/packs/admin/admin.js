import 'packs/lib/css'
import 'packs/lib/script'

import Vue from 'vue'
import EditRatePage from './pages/exchange_rates/edit.vue'
import Axios from 'axios'
import configureStore from './store'

document.addEventListener('DOMContentLoaded', () => {
  Vue.prototype.$http = Axios

  const store = configureStore(window.initialState)

  const app = new Vue({
    el: '#vue-edit-rate-page',
    store,
    render: h => h(EditRatePage)
  })
})
