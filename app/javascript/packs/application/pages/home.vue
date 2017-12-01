<template lang="pug">
  AppLayout
    ExchangeRate
</template>

<script>
import AppLayout from 'packs/shared/layouts/application.vue'
import ExchangeRate from '../components/exchange_rates/show.vue'

export default {
  components: {
    AppLayout,
    ExchangeRate
  }
}
</script>
