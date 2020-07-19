<template>
  <v-list-item class="post-list-item">
    <v-list-item-avatar>
      <v-icon class="grey lighten-1 white--text">mdi-account</v-icon>
    </v-list-item-avatar>

    <v-list-item-content>
      <nuxt-link :to="`/posts/${post.id}`" class="post-title">
        <v-list-item-title>
          {{ post.title }}
        </v-list-item-title>
      </nuxt-link>
      <v-list-item-subtitle>
        <span>
          <span>by</span>
          <nuxt-link :to="`/users/${post.user.name}`" class="post-author">
            {{ post.user.nickname }}
          </nuxt-link>
        </span>
      </v-list-item-subtitle>
      <v-list-item-subtitle v-if="post.tags" class="my-2">
        <v-slide-group class="post-tags">
          <v-chip small class="mr-1 post-tag" nuxt to="/tags/name">
            Default
          </v-chip>
          <v-chip small class="mr-1 post-tag" nuxt to="/tags/name">
            国語
          </v-chip>
          <v-chip small class="mr-1 post-tag" nuxt to="/tags/name">
            漢字
          </v-chip>
          <v-chip small class="mr-1 post-tag" nuxt to="/tags/name">
            漢検2級
          </v-chip>
          <v-chip small class="mr-1 post-tag" nuxt to="/tags/name">
            Test
          </v-chip>
        </v-slide-group>
      </v-list-item-subtitle>
      <v-list-item-subtitle>
        <span class="mr-3">2020/06/27</span>
        <span v-if="post.likes" class="mr-3">
          <v-icon small>mdi-heart</v-icon>
          123
        </span>
        <span v-if="post.messages" class="mr-3">
          <v-icon small>mdi-message</v-icon>
          22
        </span>
      </v-list-item-subtitle>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
}
</script>

<style scoped>
.post-title,
.post-author {
  color: inherit;
  text-decoration: none;
}

.post-title:hover,
.post-author:hover {
  text-decoration: underline;
}

.post-list-item {
  padding-top: 3px;
  padding-bottom: 3px;
}
</style>
