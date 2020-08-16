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
            <v-card class="text-viewer-card">
              <v-card-subtitle>
                プレビュー
              </v-card-subtitle>
              <v-divider></v-divider>
              <v-card-text class="text-viewer">
                <TextRender :txt-string="question.body" :show-image="true" />
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer app elevation="20" class="py-2">
      <v-spacer></v-spacer>
      <v-btn color="primary" depressed class="px-7" @click="saveQuestion"
        >作成</v-btn
      >
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
  data() {
    return {
      question: {
        body: '',
      },
    }
  },
  methods: {
    async saveQuestion() {
      const postId = this.$route.params.post_id
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
          this.$router.replace({
            path: `/edit/posts/${postId}/questions/${questionId}`,
          })
        })
        .catch(() => {
          this.$toast.error('作成に失敗しました')
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

<style scoped>
.text-editor-card,
.text-viewer-card {
  height: calc(100vh - 160px);
  overflow: hidden;
}

.text-editor,
.text-viewer {
  height: calc(100% - 55px);
  overflow-x: hidden;
}
</style>
