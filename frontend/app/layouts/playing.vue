<template>
  <v-app>
    <playing-header />
    <nuxt />
    <scroll-to-top></scroll-to-top>
    <my-footer />
  </v-app>
</template>

<script>
import PlayingHeader from '~/components/common/PlayingHeader.vue'
import MyFooter from '~/components/common/Footer.vue'
import ScrollToTop from '~/components/common/ScrollToTop.vue'

export default {
  name: 'Playing',
  components: {
    PlayingHeader,
    MyFooter,
    ScrollToTop,
  },
}
</script>
