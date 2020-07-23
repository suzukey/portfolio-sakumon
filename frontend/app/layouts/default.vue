<template>
  <v-app>
    <my-header />
    <nuxt />
    <scroll-to-top></scroll-to-top>
    <my-footer />
  </v-app>
</template>

<script>
import MyHeader from '~/components/common/Header.vue'
import MyFooter from '~/components/common/Footer.vue'
import ScrollToTop from '~/components/common/ScrollToTop.vue'

export default {
  name: 'Default',
  components: {
    MyHeader,
    MyFooter,
    ScrollToTop,
  },
}
</script>
