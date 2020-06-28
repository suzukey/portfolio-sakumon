<template>
  <v-card>
    <v-list two-line>
      <v-subheader>
        <v-icon class="mr-2">mdi-trending-up</v-icon>
        <span>人気の投稿</span>
      </v-subheader>
      <v-tabs v-model="tab" color="cyan darken-2" show-arrows>
        <v-tab v-for="trend in trends" :key="trend.tab">
          {{ trend.tab }}
        </v-tab>
      </v-tabs>

      <v-tabs-items v-model="tab">
        <v-tab-item v-for="trend in trends" :key="trend.tab">
          <posts-list :posts="posts" :loading="loading"></posts-list>
        </v-tab-item>
      </v-tabs-items>
    </v-list>
  </v-card>
</template>

<script>
import PostsList from '~/components/posts/core/PostsList.vue'

export default {
  components: {
    PostsList,
  },
  data() {
    return {
      posts: {},
      loading: true,
      tab: null,
      trends: [
        { tab: '日間' },
        { tab: '週間' },
        { tab: '年間' },
        { tab: '全体' },
      ],
    }
  },
}
</script>
