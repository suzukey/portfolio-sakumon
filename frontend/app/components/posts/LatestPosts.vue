<template>
  <v-card>
    <v-list two-line>
      <v-subheader>
        <v-icon class="mr-2">mdi-update</v-icon>
        <span>最新の投稿</span>
      </v-subheader>

      <posts-list :posts="posts" :loading="loading"></posts-list>
    </v-list>
  </v-card>
</template>

<script>
import PostsList from '~/components/posts/core/PostsList.vue'

export default {
  components: {
    PostsList,
  },
  data() {
    return {
      posts: {},
      loading: true,
    }
  },
}
</script>
