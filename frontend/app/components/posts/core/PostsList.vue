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
        <template v-if="existUserInfo">
          <posts-list-item :post="post"></posts-list-item>
        </template>
        <template v-else>
          <posts-list-item-exclude-user
            :post="post"
          ></posts-list-item-exclude-user>
        </template>
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
import PostsListItemExcludeUser from '~/components/posts/core/PostsListItemExcludeUser.vue'

export default {
  components: {
    PostsListItem,
    PostsListItemExcludeUser,
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
    existUserInfo: {
      type: Boolean,
      default: true,
    },
  },
  computed: {
    existPosts() {
      return this.posts && this.posts.length > 0
    },
  },
}
</script>
