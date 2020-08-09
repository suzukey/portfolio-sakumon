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
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn color="primary" class="px-7" @click="saveQuestion">
        作成
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
  },
  data() {
    return {
      question: {
        body: '',
      },
    }
  },
  methods: {
    async saveQuestion() {
      const postId = this.postId
      const questionUrl = `/api/v1/posts/${postId}/questions`
      const questionInfo = {
        body: this.question.body,
        status: this.question.status,
      }
      await this.$axios
        .post(questionUrl, questionInfo)
        .then((res) => {
          this.$toast.success('作成しました')
          const questionId = res.data.question.id
          this.$router.push({
            path: `/edit/posts/${postId}/questions/${questionId}`,
          })
        })
        .catch(() => {
          this.$toast.error('作成に失敗しました')
        })
    },
  },
}
</script>
