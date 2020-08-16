<template>
  <div>
    <my-header></my-header>
    <v-main>
      <v-container>
        <v-row justify="center">
          <v-col cols="12" sm="6">
            <TextEditorCard
              v-model="question.body"
              :post-id="$route.params.post_id"
            />
          </v-col>
          <v-col cols="12" sm="6">
            <TextViewerCard :txt-string="question.body" />
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer app elevation="20" class="py-2">
      <v-spacer></v-spacer>
      <v-btn
        color="primary"
        depressed
        class="px-7"
        :disabled="isChanged"
        @click="saveQuestion"
      >
        保存
      </v-btn>
    </v-footer>
  </div>
</template>

<script>
import MyHeader from '~/components/common/Header.vue'

export default {
  layout: 'customizable',
  middleware: 'authenticated',
  components: {
    MyHeader,
  },
  async asyncData({ $axios, params, error }) {
    const postId = params.post_id
    const questionId = params.question_id
    const questionUrl = `/api/v1/posts/${postId}/questions/${questionId}`

    try {
      const response = await $axios.$get(questionUrl)

      const question = response.question
      const currentQuestion = Object.assign({}, question)
      const loading = false

      return { question, currentQuestion, loading }
    } catch (err) {
      error({
        statusCode: err.response.status,
        message: err.response.data.message,
      })
    }
  },
  data() {
    return {
      question: {
        body: '',
      },
      currentQuestion: {},
      loading: true,
    }
  },
  computed: {
    isChanged() {
      const questionJson = JSON.stringify(this.question)
      const currentQuestionJson = JSON.stringify(this.currentQuestion)
      return questionJson !== currentQuestionJson
    },
  },
  methods: {
    updatedQuestion() {
      this.currentQuestion = Object.assign({}, this.question)
    },
    async saveQuestion() {
      const postId = this.$route.params.post_id
      const questionId = this.$route.params.question_id
      const questionUrl = `/api/v1/posts/${postId}/questions/${questionId}`
      const questionInfo = {
        body: this.question.body,
        status: this.question.status,
      }
      await this.$axios
        .put(questionUrl, questionInfo)
        .then((res) => {
          this.$toast.success('保存しました')
          this.updatedQuestion()
        })
        .catch(() => {
          this.$toast.error('保存に失敗しました')
        })
    },
  },
  head() {
    return {
      title: '新規問題',
    }
  },
}
</script>

<style>
.text-editor-card,
.text-viewer-card {
  height: calc(100vh - 160px);
  overflow: hidden;
}

.text-editor-card .text-editor,
.text-viewer-card .text-viewer {
  height: calc(100% - 55px);
  overflow-x: hidden;
}
</style>
