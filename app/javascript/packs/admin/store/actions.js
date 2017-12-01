import Axios from 'axios'

export const create = ({ state, commit }, params) => {
  let headers = { 'X-CSRF-Token': state.authenticity_token }
  let url = '/admin/exchange_rates.json'

  return Axios.post(url, params.form, { headers: headers })
    .then((response) => console.log(response))
}
