<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card>
            <v-list two-line>
              <v-subheader>
                <v-icon class="mr-2" color="accent">mdi-magnify</v-icon>
                <span>「{{ searchQuery }}」の検索結果</span>
              </v-subheader>
              <posts-list :posts="posts.posts" :loading="loading"></posts-list>
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
  async asyncData({ $axios, query }) {
    let url = 'api/v1/posts/search?'
    url += 'q=' + query.q || ''
    const response = await $axios.$get(url)
    return {
      posts: response,
      loading: false,
    }
  },
  data() {
    return {
      posts: {},
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
  watchQuery: true,
}
</script>
