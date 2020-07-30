<template>
  <v-list-item
    nuxt
    class="post-list-item py-1"
    @click="$router.push({ path: `/posts/${post.id}` })"
  >
    <v-list-item-avatar v-if="showUserInfo">
      <nuxt-link
        :to="`/users/${post.user.name}`"
        class="post-icon"
        @click.native.stop
      >
        <v-avatar color="grey" size="40">
          <user-icon :icon-url="post.user.iconUrl" />
        </v-avatar>
      </nuxt-link>
    </v-list-item-avatar>

    <v-list-item-content>
      <v-list-item-title>
        <nuxt-link
          :to="`/posts/${post.id}`"
          class="post-title"
          @click.native.stop
        >
          {{ post.title }}
        </nuxt-link>
      </v-list-item-title>
      <v-list-item-subtitle v-if="showUserInfo">
        <span>by</span>
        <nuxt-link
          :to="`/users/${post.user.name}`"
          class="post-author"
          @click.native.stop
        >
          {{ post.user.nickname }}
        </nuxt-link>
      </v-list-item-subtitle>
      <v-list-item-subtitle v-if="post.tags" class="my-2">
        <v-slide-group class="post-tags">
          <v-chip
            small
            class="mr-1 post-tag"
            nuxt
            to="/tags/name"
            @click.native.stop
          >
            Default
          </v-chip>
          <v-chip
            small
            class="mr-1 post-tag"
            nuxt
            to="/tags/name"
            @click.native.stop
          >
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
import UserIcon from '~/components/common/UserIcon.vue'

export default {
  components: {
    UserIcon,
  },
  props: {
    post: {
      type: Object,
      required: true,
    },
    showUserInfo: {
      type: Boolean,
      default: true,
    },
  },
}
</script>

<style scoped>
.post-icon,
.post-title,
.post-author {
  color: inherit;
  text-decoration: none;
}

.post-author:hover {
  text-decoration: underline;
}
</style>
