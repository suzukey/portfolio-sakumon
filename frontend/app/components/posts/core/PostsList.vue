<template>
  <div class="posts-list">
    <template v-if="loading">
      <div v-for="n of 10" :key="n" class="posts-list-item-loading">
        <v-divider></v-divider>
        <v-skeleton-loader
          type="list-item-avatar-three-line"
        ></v-skeleton-loader>
      </div>
    </template>
    <template v-else-if="existPosts">
      <div v-for="post in posts" :key="post.id" class="posts-list-item">
        <v-divider></v-divider>
        <posts-list-item :post="post"></posts-list-item>
      </div>
    </template>
    <template v-else>
      <div class="not-exist">
        <v-divider></v-divider>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>該当なし</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </div>
    </template>
  </div>
</template>

<script>
import PostsListItem from '~/components/posts/core/PostsListItem.vue'

export default {
  components: {
    PostsListItem,
  },
  props: {
    posts: {
      type: Array,
      required: true,
    },
    loading: {
      type: Boolean,
      required: true,
    },
  },
  computed: {
    existPosts() {
      return this.posts.length > 0
    },
  },
}
</script>
