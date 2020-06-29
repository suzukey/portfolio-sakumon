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
}
</script>
