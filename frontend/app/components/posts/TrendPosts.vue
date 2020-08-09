<template>
  <v-card>
    <v-list two-line>
      <v-subheader>
        <v-icon class="mr-2" color="accent">mdi-trending-up</v-icon>
        <span>人気の投稿</span>
      </v-subheader>
      <v-tabs v-model="tab" color="primary" show-arrows>
        <v-tab v-for="trend in trends" :key="trend.tab">
          {{ trend.name }}
        </v-tab>
      </v-tabs>

      <v-tabs-items v-model="tab">
        <v-tab-item v-for="trend in trends" :key="trend.tab">
          <posts-list
            :posts="posts[trend.tab].data"
            :loading="posts[trend.tab].loading"
          ></posts-list>
        </v-tab-item>
      </v-tabs-items>
    </v-list>
  </v-card>
</template>

<script>
import PostsList from '~/components/list/posts/PostsList.vue'

export default {
  components: {
    PostsList,
  },
  async fetch() {
    let trendScope = this.$route.query.scope

    // ロゴをクリックされた時を想定
    if (!trendScope && this.tab !== 0) {
      this.tab = 0
      return
    }
    // 直リンクや再読み込みを想定
    if (process.server && trendScope) {
      this.tab = this.getTabNum(trendScope)
    }

    trendScope = this.trends[this.tab].tab

    let url = 'api/v1/posts/trend?'
    url += 'scope=' + (trendScope || '')
    const response = await this.$axios.$get(url)
    this.posts[trendScope] = { data: response.posts, loading: false }
  },
  data() {
    return {
      posts: {
        day: { data: [], loading: true },
        week: { data: [], loading: true },
        month: { data: [], loading: true },
        year: { data: [], loading: true },
        all: { data: [], loading: true },
      },
      tab: 0,
      trends: [
        { tab: 'day', name: 'Day' },
        { tab: 'week', name: 'Week' },
        { tab: 'month', name: 'Month' },
        { tab: 'year', name: 'Year' },
        { tab: 'all', name: 'All' },
      ],
    }
  },
  watch: {
    '$route.query': '$fetch',
    tab() {
      if (this.tab === 0) {
        this.$router.replace({ query: {} }).catch(() => {})
      } else {
        const trendScope = this.trends[this.tab].tab
        this.$router.replace({ query: { scope: trendScope } }).catch(() => {})
      }
    },
  },
  methods: {
    getTabNum(scope) {
      let tabNum = this.trends.findIndex((trend) => trend.tab === scope)
      if (tabNum < 0 && tabNum > this.trends.length) {
        tabNum = 0
      }
      return tabNum
    },
  },
}
</script>
