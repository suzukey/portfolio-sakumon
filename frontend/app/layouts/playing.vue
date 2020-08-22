<template>
  <v-app>
    <playing-header />
    <nuxt />
    <my-footer />
  </v-app>
</template>

<script>
import PlayingHeader from '~/components/common/PlayingHeader.vue'
import MyFooter from '~/components/common/Footer.vue'

export default {
  name: 'Playing',
  components: {
    PlayingHeader,
    MyFooter,
  },
}
</script>
