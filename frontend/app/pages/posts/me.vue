<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card>
            <v-list two-line>
              <v-subheader class="pb-1">
                <v-icon class="mr-2" color="accent">mdi-file</v-icon>
                <span>投稿一覧</span>
                <v-spacer></v-spacer>
                <v-btn color="primary" outlined nuxt to="/edit/posts/new">
                  新規作成
                </v-btn>
              </v-subheader>
              <PostList
                :posts="posts"
                :loading="loading"
                :show-user-info="false"
                :show-status="true"
                :show-edit="true"
                no-records="投稿がありません"
              />
              <Pagination :length="totalPages" :page="currentPage" />
            </v-list>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import PostList from '~/components/list/posts/PostsList.vue'
import Pagination from '~/components/list/Pagination.vue'

export default {
  middleware: 'authenticated',
  components: {
    PostList,
    Pagination,
  },
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
