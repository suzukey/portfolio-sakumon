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
                :posts="posts"
                :loading="loading"
                :exist-user-info="false"
                no-records="投稿がありません"
              ></posts-list>
              <pagination :length="totalPages" :page="currentPage"></pagination>
            </v-list>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import PostsList from '~/components/posts/core/PostsList.vue'
import Pagination from '~/components/posts/core/Pagination.vue'

export default {
  components: {
    PostsList,
    Pagination,
  },
  async asyncData({ $axios, params, query, error }) {
    const username = params.name

    const userUrl = `/api/v1/users/${username}`
    let postsUrl = `/api/v1/users/${username}/posts`
    postsUrl += '?page=' + (query.page || '1')

    try {
      const userResponse = await $axios.$get(userUrl)
      const postsResponse = await $axios.$get(postsUrl)

      const user = userResponse.user
      const posts = postsResponse.posts
      const totalPages = postsResponse.meta.total_pages
      const currentPage = postsResponse.meta.current_page
      const loading = false

      return { user, posts, totalPages, currentPage, loading }
    } catch (err) {
      error({
        statusCode: err.response.status,
        message: err.response.data.message,
      })
    }
  },
  data() {
    return {
      user: {},
      posts: [],
      totalPages: 1,
      currentPage: 1,
      loading: true,
    }
  },
  head() {
    return {
      title: this.user.nickname,
    }
  },
  watchQuery: ['page'],
}
</script>
