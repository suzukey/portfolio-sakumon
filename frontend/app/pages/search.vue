<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card>
            <v-card-text>タイトルと説明文から検索を行います</v-card-text>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card>
            <v-list two-line>
              <v-subheader>
                <v-icon class="mr-2" color="accent">mdi-magnify</v-icon>
                <span>「{{ searchQuery }}」の検索結果</span>
              </v-subheader>
              <posts-list :posts="posts" :loading="loading"></posts-list>
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
  async asyncData({ $axios, query, error }) {
    let url = 'api/v1/posts/search'
    url += '?q=' + (query.q || '')
    url += '&page=' + (query.page || '1')

    try {
      const response = await $axios.$get(url)

      const posts = response.posts
      const totalPages = response.meta.total_pages
      const currentPage = response.meta.current_page
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
  computed: {
    searchQuery() {
      return this.$route.query.q
    },
  },
  head() {
    return {
      title: '「' + this.searchQuery + '」の検索結果',
    }
  },
  watchQuery: ['page', 'q'],
}
</script>
