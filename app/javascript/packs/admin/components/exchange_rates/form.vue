<template lang="pug">
  form.exchange-rate-form(@submit.prevent="create" role="form")
    .form-group
      label Курс
      .errors(v-if="errors.value")
        span.label.label-danger(v-for="message in errors.value") {{ message }}
      input.form-control(v-model="form.exchange_rate.value" placeholder="Курс" type="text")
    .form-group
      label Дата/Время
      .errors(v-if="errors.datetime")
        span.label.label-danger.error-label(v-for="message in errors.datetime") {{ message }}
      date-picker.datetime-input(v-model="form.exchange_rate.datetime" type="datetime" format="yyyy-MM-dd HH:mm" v-bind:minute-step="1" lang="ru")
    button.btn.btn-primary(type="submit")  Отправить

</template>

<script>
import DatePicker from 'vue2-datepicker'

export default {
  data () {
    return {
      form: {
        exchange_rate: {
          value: this.$store.state.exchange_rate.value,
          datetime: this.$store.state.exchange_rate.datetime
        }
      },
      errors: { }
    }
  },

  components: {
    DatePicker
  },

  methods: {
    create () {
      this.$store.dispatch('create', { form: this.form })
        .then((response) => {
          this.errors = { }
        })
        .catch((e) => {
          this.errors = e.response.data.errors
        })
    }
  }
}
</script>

<style lang="scss">
  .exchange-rate-form {
    width: 500px;
    margin-right: auto;
    margin-left: auto;
    text-align: left;
  }

  .datetime-input {
    width: 100% !important;
    display: block !important;
  }

  .errors {
    margin-bottom: 10px;
  }

  .error-label {
    margin-right: 4px;
  }
</style>
