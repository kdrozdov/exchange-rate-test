<template lang="pug">
  AppLayout
    ExchangeRateForm

</template>

<script>
import AppLayout from 'packs/shared/layouts/application.vue'
import ExchangeRateForm from 'packs/admin/components/exchange_rates/form.vue'

export default {
  components: {
    AppLayout,
    ExchangeRateForm
  }
}
</script>
