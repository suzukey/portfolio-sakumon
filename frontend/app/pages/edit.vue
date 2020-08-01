<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card>
            <v-list two-line>
              <v-subheader>
                <v-icon class="mr-2" color="accent">mdi-file</v-icon>
                <span>投稿一覧</span>
                <v-spacer></v-spacer>
                <v-btn color="primary" outlined nuxt to="/posts/new">
                  新規作成
                </v-btn>
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
export default {
  middleware: 'authenticated',
  async asyncData({ $axios, query, error }) {
    let postsUrl = `/api/v1/me/posts`
    postsUrl += '?page=' + (query.page || '1')

    try {
      const postsResponse = await $axios.$get(postsUrl)

      const posts = postsResponse.posts
      const totalPages = postsResponse.meta.total_pages
      const currentPage = postsResponse.meta.current_page
      const loading = false

      return { posts, totalPages, currentPage, loading }
    } catch (err) {
      error({
        statusCode: err.response.status,
        message: err.response.data.message,
      })
    }
  },
  data() {
    return {
      posts: [],
      totalPages: 1,
      currentPage: 1,
      loading: true,
    }
  },
  head() {
    return {
      title: '投稿一覧',
    }
  },
  watchQuery: ['page'],
}
</script>
