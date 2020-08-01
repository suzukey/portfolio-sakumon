<template>
  <v-main>
    <no-contents></no-contents>
  </v-main>
</template>

<script>
import NoContents from '~/components/NoContents.vue'

export default {
  components: {
    NoContents,
  },
  head() {
    return {
      title: 'ヘルプ',
    }
  },
}
</script>
