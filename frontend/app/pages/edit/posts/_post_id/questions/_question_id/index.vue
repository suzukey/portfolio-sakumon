<template>
  <div>
    <my-header></my-header>
    <v-main>
      <v-container>
        <v-row justify="center">
          <v-col cols="12" sm="6">
            <TextViewerCard :txt-string="question.body" />
          </v-col>
          <v-col cols="12" sm="6">
            <v-card class="choice-list-card">
              <v-list two-line class="choice-list-area">
                <v-subheader class="pb-1">
                  <v-icon class="mr-2" color="accent">
                    mdi-checkbox-marked-outline
                  </v-icon>
                  <span>選択肢一覧</span>
                  <v-spacer></v-spacer>
                  <v-btn color="primary" outlined nuxt :to="newChoiceLink">
                    新規作成
                  </v-btn>
                </v-subheader>
                <ChoiceList
                  :post-id="$route.params.post_id"
                  :question="question"
                  :choices="question.choices"
                  :loading="loading"
                />
              </v-list>
            </v-card>
            <div class="py-3"></div>
            <v-card class="edit-question-card">
              <div class="edit-question-area">
                <v-card-text>
                  <!-- <v-switch
                    v-model="question.shuffle"
                    label="選択肢をシャッフルする"
                  ></v-switch> -->
                  <v-radio-group v-model="question.status" row>
                    <v-radio label="公開" value="publish"></v-radio>
                    <v-radio label="下書き" value="draft"></v-radio>
                  </v-radio-group>
                </v-card-text>
                <v-card-actions>
                  <v-btn
                    block
                    color="primary"
                    depressed
                    :disabled="!isChanged"
                    class="px-7"
                    @click="saveQuestion"
                  >
                    保存
                  </v-btn>
                </v-card-actions>
                <v-card-actions>
                  <v-btn
                    block
                    outlined
                    nuxt
                    :to="`/edit/posts/${$route.params.post_id}/questions/${$route.params.question_id}/body`"
                  >
                    問題文を編集
                  </v-btn>
                </v-card-actions>
              </div>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer app elevation="20" class="py-2">
      <v-spacer></v-spacer>
      <v-btn outlined class="ml-2" disabled nuxt :to="playLink">
        問題を試す
      </v-btn>
      <v-btn color="error" outlined class="ml-2 px-7" @click="deleteQuestion">
        削除
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
        shuffle: true,
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
    newChoiceLink() {
      const postId = this.$route.params.post_id
      const questionId = this.$route.params.question_id
      return `/edit/posts/${postId}/questions/${questionId}/choices/new`
    },
    playLink() {
      const postId = this.$route.params.post_id
      const questionId = this.$route.params.question_id
      return `/edit/posts/${postId}/questions/${questionId}/play`
    },
  },
  methods: {
    updatedQuestion() {
      this.currentQuestion = Object.assign({}, this.question)
    },
    async deleteQuestion() {
      const postId = this.$route.params.post_id
      const questionId = this.$route.params.question_id
      const questionUrl = `/api/v1/posts/${postId}/questions/${questionId}`
      const nextUrl = `/edit/posts/${postId}`

      await this.$axios
        .delete(questionUrl)
        .then((res) => {
          this.$toast.success('削除しました')
          this.$router.replace(nextUrl)
        })
        .catch(() => {
          this.$toast.error('削除に失敗しました')
        })
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
      title: '問題編集',
    }
  },
}
</script>

<style scoped>
.text-viewer-card {
  height: calc(100vh - 160px);
}

.choice-list-card,
.edit-question-card {
  height: calc(calc(100vh - 160px) / 2 - 12px);
  overflow: hidden;
}

.choice-list-card .choice-list-area,
.edit-question-card .edit-question-area {
  height: 100%;
  overflow-y: auto;
}

.choice-list-card .choice-list {
  height: calc(100% - 55px);
  overflow-x: hidden;
}
</style>
