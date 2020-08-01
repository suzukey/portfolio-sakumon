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
        <posts-list-item
          :show-user-info="showUserInfo"
          :show-status="showStatus"
          :show-edit="showEdit"
          :post="post"
        ></posts-list-item>
      </div>
    </template>
    <template v-else>
      <div class="not-exist">
        <v-divider></v-divider>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>{{ noRecords }}</v-list-item-title>
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
    showUserInfo: {
      type: Boolean,
      default: true,
    },
    showStatus: {
      type: Boolean,
      default: false,
    },
    showEdit: {
      type: Boolean,
      default: false,
    },
    noRecords: {
      type: String,
      default: '該当なし',
    },
  },
  computed: {
    existPosts() {
      return this.posts && this.posts.length > 0
    },
  },
}
</script>
