<template lang="pug">
  .app
    AppHeader
    main.container.main-container
      slot
</template>

<script>
import AppHeader from 'packs/shared/components/header.vue'

export default {
  components: {
    AppHeader
  }
}
</script>

<style lang="scss">
  body {
    padding-top: 5rem;
  }

  .main-container {
    padding: 40px 15px;
    text-align: center;
  }
</style>>
