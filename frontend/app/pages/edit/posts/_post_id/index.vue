<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <EditPost :post="post" />
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card>
            <v-list two-line>
              <v-subheader class="pb-1">
                <v-icon class="mr-2" color="accent">mdi-file-question</v-icon>
                <span>問題一覧</span>
                <v-spacer></v-spacer>
                <v-btn color="primary" outlined nuxt :to="newQuestionLink">
                  新規作成
                </v-btn>
              </v-subheader>
              <QuestionList
                :post="post"
                :questions="questions"
                :loading="loading"
              />
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
  async asyncData({ $axios, params, error }) {
    const postId = params.post_id
    const postUrl = `/api/v1/posts/${postId}`
    const questionsUrl = `${postUrl}/questions`

    try {
      const postResponse = await $axios.$get(postUrl)
      const questionsResponse = await $axios.$get(questionsUrl)

      const post = postResponse.post
      const questions = questionsResponse.questions

      const loading = false

      return { post, questions, loading }
    } catch (err) {
      error(
        error({
          statusCode: err.response.status,
          message: err.response.data.message,
        })
      )
    }
  },
  data() {
    return {
      post: {},
      questions: [],
      loading: true,
    }
  },
  computed: {
    newQuestionLink() {
      const postId = this.post.id
      return `/edit/posts/${postId}/questions/new`
    },
  },
  head() {
    return {
      title: '投稿編集',
    }
  },
}
</script>
