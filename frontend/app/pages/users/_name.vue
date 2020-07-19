<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card class="py-2">
            <v-list-item>
              <v-list-item-avatar size="50">
                <v-icon large class="grey white--text">mdi-account</v-icon>
              </v-list-item-avatar>

              <v-list-item-content>
                <v-list-item-title>{{ user.nickname }}</v-list-item-title>
                <v-list-item-subtitle>@{{ user.name }}</v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>
            <v-card-text v-if="user.profile">"{{ user.profile }}"</v-card-text>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card class="user-info">
            <v-list two-line>
              <v-subheader>
                <v-icon class="mr-2" color="accent">mdi-file</v-icon>
                <span>投稿一覧</span>
              </v-subheader>
              <posts-list
                :posts="posts.posts"
                :loading="loading"
                :exist-user-info="false"
              ></posts-list>
            </v-list>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import PostsList from '~/components/posts/core/PostsList.vue'

export default {
  components: {
    PostsList,
  },
  async fetch() {
    const userName = this.$route.params.name

    let userUrl = 'api/v1/users/'
    userUrl += userName
    const userResponse = await this.$axios.$get(userUrl)
    this.user = userResponse.user

    let postsUrl = 'api/v1/users/'
    postsUrl += userName
    postsUrl += '/posts'
    const postsResponse = await this.$axios.$get(postsUrl)
    this.posts = postsResponse

    this.loading = false
  },
  data() {
    return {
      user: {},
      posts: {},
      loading: true,
    }
  },
}
</script>
