<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card v-if="!loading" class="py-2">
            <v-list-item nuxt :to="`/users/${post.user.name}`">
              <v-list-item-avatar>
                <user-icon :icon-url="post.user.iconUrl" />
              </v-list-item-avatar>

              <v-list-item-content>
                <v-list-item-title>{{ post.user.nickname }}</v-list-item-title>
                <v-list-item-subtitle>
                  @{{ post.user.name }}
                </v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>

            <v-card-title>{{ post.title }}</v-card-title>
            <v-card-text>
              <TextRender :txt-string="post.body" />
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" dark class="px-7">
                開始
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import UserIcon from '~/components/common/UserIcon.vue'

export default {
  components: {
    UserIcon,
  },
  async asyncData({ $axios, params, error }) {
    const postId = params.post_id
    const postUrl = `api/v1/posts/${postId}`

    try {
      const response = await $axios.$get(postUrl)

      const post = response.post
      const loading = false

      return { post, loading }
    } catch (err) {
      error({
        statusCode: err.response.status,
        message: err.response.data.message,
      })
    }
  },
  data() {
    return {
      post: {},
      loading: true,
    }
  },
  head() {
    return {
      title: this.post.title,
    }
  },
}
</script>
