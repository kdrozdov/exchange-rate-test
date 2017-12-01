import Vue from 'vue'
import Vuex from 'vuex'
import * as actions from './actions.js'

const ActionCable = require('actioncable')
const WEBSOCKET_URL = 'ws://lvh.me:3000/cable'

export default function(initialState = {}) {
  Vue.use(Vuex)

  const state = {
    ...initialState,
    consumer: ActionCable.createConsumer(WEBSOCKET_URL)
  }

  const store = new Vuex.Store({
    state,
    actions
    // mutations
  })

  return store
}
