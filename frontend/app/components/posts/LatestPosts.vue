<template>
  <v-card>
    <v-list two-line>
      <v-subheader>
        <v-icon class="mr-2" color="accent">mdi-update</v-icon>
        <span>最新の投稿</span>
      </v-subheader>

      <PostsList :posts="posts" :loading="loading" />
    </v-list>
  </v-card>
</template>

<script>
export default {
  async fetch() {
    const url = 'api/v1/posts/latest'
    const response = await this.$axios.$get(url)
    this.posts = response.posts
    this.loading = false
  },
  data() {
    return {
      posts: [],
      loading: true,
    }
  },
}
</script>
