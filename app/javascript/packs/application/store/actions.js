import Axios from 'axios'

const RATE_SOURCE_URL = 'https://www.cbr-xml-daily.ru/daily_json.js'

export const fetchExchangeRate = ({ state, commit }) => {
  if (showForced(state.exchange_rate)) { return }

  let params = { order: state.marketing  }
  Axios.get(RATE_SOURCE_URL)
    .then((response) => {
      let date = new Date()
      console.log('rate updated', date.toISOString())

      let rate = {
        nominal: response.data.Valute.USD.Nominal,
        value: response.data.Valute.USD.Value,
        is_forced: false
      }
      commit('updateExchangeRate', { exchange_rate: rate })
    })
}

const showForced = (exchange_rate) => {
  if (!exchange_rate.is_forced) { return false }

  let nowDate = new Date()
  let endDate = new Date(exchange_rate.datetime)

  if (endDate > nowDate) { return true }
  return false
}

export const subscribe = ({ state, commit }) => {
  const params = { channel: 'ExchangeRateChannel' }
  state.consumer.subscriptions.create(params, {
    received: (data) => {
      let exchange_rate = JSON.parse(data)
      if (showForced(exchange_rate)) {
        commit('updateExchangeRate', { exchange_rate: exchange_rate })
      }
    }
  })
}
