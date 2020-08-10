<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <EditQuestion :post-id="postId" :question="question" />
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import EditQuestion from '~/components/questions/EditQuestion.vue'

export default {
  middleware: 'authenticated',
  components: {
    EditQuestion,
  },
  async asyncData({ $axios, params, error }) {
    const postId = params.post_id
    const questionId = params.question_id
    const url = `/api/v1/posts/${postId}/questions/${questionId}`

    try {
      const response = await $axios.$get(url)
      const question = response.question

      const loading = false

      return { postId, question, loading }
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
      postId: '',
      question: {},
      loading: true,
    }
  },
  head() {
    return {
      title: '問題編集',
    }
  },
}
</script>
