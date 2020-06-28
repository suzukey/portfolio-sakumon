<template>
  <v-main>
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <trend-posts></trend-posts>
        </v-col>
      </v-row>
      <v-row justify="center">
        <v-col cols="12">
          <latest-posts></latest-posts>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import LatestPosts from '~/components/posts/LatestPosts.vue'
import TrendPosts from '~/components/posts/TrendPosts.vue'

export default {
  components: {
    LatestPosts,
    TrendPosts,
  },
}
</script>
