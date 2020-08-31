<template>
  <div class="posts-list">
    <template v-if="loading">
      <Skeletons :count="10" />
    </template>
    <template v-else-if="existPosts">
      <div v-for="post in posts" :key="post.id" class="posts-list-item">
        <v-divider></v-divider>
        <PostsListItem
          :show-user-info="showUserInfo"
          :show-status="showStatus"
          :show-edit="showEdit"
          :post="post"
        />
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
export default {
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
