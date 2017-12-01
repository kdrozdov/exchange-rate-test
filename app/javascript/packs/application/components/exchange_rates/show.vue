<template lang="pug">
  span
    template(v-if="!exchangeRate")
      |Данные обновляются&nbsp;
      i.fa.fa-refresh.fa-spin.fa-3x.fa-fw
    template(v-else)
      h1
        | Текущий курс: {{ exchangeRate.nominal }} USD =&nbsp;
        span.text-success {{ exchangeRate.value }} РУБ
      span
        |Источник:&nbsp;
        a(href="https://www.cbr-xml-daily.ru/") www.cbr-xml-daily.ru
</template>

<script>
export default {
  mounted () {
    this.$store.dispatch('subscribe')

    if (this.$store.state.exchange_rate.empty) {
      this.$store.dispatch('fetchExchangeRate')
    }
    setInterval(() => { this.$store.dispatch('fetchExchangeRate') }, 10000)
  },

  computed: {
    exchangeRate () {
      return this.$store.state.exchange_rate
    }
  }
}
</script>
