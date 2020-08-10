<template>
  <v-card class="py-2">
    <v-card-text>
      <v-textarea
        v-model="question.body"
        label="内容"
        auto-grow
        row-height="20"
        rows="3"
      />
      <v-radio-group v-model="question.status" row>
        <v-radio label="公開" value="publish"></v-radio>
        <v-radio label="下書き" value="draft"></v-radio>
      </v-radio-group>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn
        color="primary"
        :disabled="!isChanged"
        class="px-7"
        @click="saveQuestion"
      >
        保存
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: {
    postId: {
      type: String,
      required: true,
    },
    question: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      currentQuestion: {},
    }
  },
  computed: {
    isChanged() {
      const questionJson = JSON.stringify(this.question)
      const currentQuestionJson = JSON.stringify(this.currentQuestion)
      return questionJson !== currentQuestionJson
    },
  },
  created() {
    this.updatedQuestion()
  },
  methods: {
    updatedQuestion() {
      this.currentQuestion = Object.assign({}, this.question)
    },
    async saveQuestion() {
      const postId = this.postId
      const questionId = this.question.id
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
}
</script>
