<template>
  <v-main>
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <v-card>
            <v-list two-line>
              <v-subheader>
                <v-icon class="mr-2">mdi-trending-up</v-icon>
                <span>人気の投稿</span>
              </v-subheader>
              <v-tabs color="cyan darken-2" show-arrows>
                <v-tab>日間</v-tab>
                <v-tab>週間</v-tab>
                <v-tab>年間</v-tab>
                <v-tab>全体</v-tab>
              </v-tabs>

              <v-tabs-items>
                <div v-for="n of 10" :key="n">
                  <v-divider></v-divider>
                  <post-list></post-list>
                </div>
              </v-tabs-items>
            </v-list>
          </v-card>
        </v-col>
      </v-row>
      <v-row justify="center">
        <v-col cols="12">
          <v-card>
            <v-list two-line>
              <v-subheader>
                <v-icon class="mr-2">mdi-update</v-icon>
                <span>最新の投稿</span>
              </v-subheader>
              <div v-for="n of 10" :key="n">
                <v-divider></v-divider>
                <post-list></post-list>
              </div>
            </v-list>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import PostList from '~/components/posts/PostList.vue'

export default {
  components: {
    PostList,
  },
}
</script>
