<template>
  <v-fab-transition>
    <v-btn
      v-show="isShowUp"
      color="primary"
      dark
      fixed
      bottom
      right
      fab
      @click="toTop"
    >
      <v-icon>mdi-chevron-up</v-icon>
    </v-btn>
  </v-fab-transition>
</template>

<script>
export default {
  data() {
    return {
      isShowUp: false,
    }
  },
  mounted() {
    window.addEventListener('scroll', this.onScreenEvent)
    window.addEventListener('resize', this.onScreenEvent)
    window.addEventListener('load', this.onScreenEvent)
  },
  methods: {
    onScreenEvent() {
      this.isShowUp = window.pageYOffset >= 32
    },
    toTop() {
      this.$vuetify.goTo(0)
    },
  },
}
</script>
