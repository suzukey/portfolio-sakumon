<template>
  <div>
    <my-header></my-header>
    <v-main>
      <v-container>
        <v-row justify="center">
          <v-col cols="12" sm="6">
            <TextViewerCard :txt-string="question.body" title="問題文" />
            <div class="py-3"></div>
            <ChoiceViewerCard
              :txt-string="choice.body"
              class="choice-viewer-card"
            />
          </v-col>
          <v-col cols="12" sm="6">
            <v-card class="edit-choice-card">
              <TextEditorCard
                v-model="choice.body"
                :post-id="$route.params.post_id"
                title="選択肢"
                class="edit-choice-card"
              />
            </v-card>
            <div class="py-3"></div>
            <v-card class="choice-info-card">
              <v-card-text>
                <v-switch
                  v-model="choice.correct"
                  label="正解の選択肢"
                ></v-switch>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer app elevation="20" class="py-2">
      <v-spacer></v-spacer>
      <v-btn color="primary" depressed class="px-7" @click="saveChoice">
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
    const choiceId = params.choice_id
    const questionUrl = `/api/v1/posts/${postId}/questions/${questionId}`
    const choiceUrl = `${questionUrl}/choices/${choiceId}`

    try {
      const questionResponse = await $axios.$get(questionUrl)
      const choiceResponse = await $axios.$get(choiceUrl)

      const question = questionResponse.question
      const choice = choiceResponse.choice
      const loading = false

      return { question, choice, loading }
    } catch (err) {
      error({
        statusCode: err.response.status,
        message: err.response.data.message,
      })
    }
  },
  data() {
    return {
      choice: {
        body: '',
      },
    }
  },
  methods: {
    async saveChoice() {
      const postId = this.$route.params.post_id
      const questionId = this.$route.params.question_id
      const choiceId = this.$route.params.choice_id
      const choiceUrl = `/api/v1/posts/${postId}/questions/${questionId}/choices/${choiceId}`
      const choiceInfo = {
        body: this.choice.body,
        correct: this.choice.correct,
      }
      await this.$axios
        .put(choiceUrl, choiceInfo)
        .then((res) => {
          this.$toast.success('保存しました')
          this.$router.push({
            path: `/edit/posts/${postId}/questions/${questionId}`,
          })
        })
        .catch(() => {
          this.$toast.error('保存に失敗しました')
        })
    },
  },
  head() {
    return {
      title: '選択肢編集',
    }
  },
}
</script>

<style>
.text-viewer-card {
  height: calc(calc(100vh - 160px) / 2 - 12px);
}

.choice-viewer-card,
.edit-choice-card,
.choice-info-card {
  overflow: hidden;
}

.choice-viewer-card {
  height: calc(calc(100vh - 160px) / 2 - 12px);
}

.edit-choice-card {
  height: calc(calc(100vh - 160px) / 3 * 2 - 12px);
}

.choice-info-card {
  height: calc(calc(100vh - 160px) / 3 * 1 - 12px);
}
</style>
