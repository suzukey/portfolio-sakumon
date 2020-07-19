<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card v-if="!loading" class="py-2">
            <v-list-item nuxt :to="`/users/${post.user.name}`">
              <v-list-item-avatar>
                <v-icon class="grey white--text">mdi-account</v-icon>
              </v-list-item-avatar>

              <v-list-item-content>
                <v-list-item-title>{{ post.user.nickname }}</v-list-item-title>
                <v-list-item-subtitle>
                  @{{ post.user.name }}
                </v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>

            <v-card-title>{{ post.title }}</v-card-title>
            <v-card-subtitle>{{ post.body }}</v-card-subtitle>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" dark class="px-7">
                プレイ
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
export default {
  async fetch() {
    const postId = this.$route.params.id

    let postUrl = 'api/v1/posts/'
    postUrl += postId
    const response = await this.$axios.$get(postUrl)
    this.post = response.post

    this.loading = false
  },
  data() {
    return {
      post: {},
      loading: true,
    }
  },
}
</script>
