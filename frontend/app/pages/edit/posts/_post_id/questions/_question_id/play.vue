<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card class="py-2">
            <v-card-title>問題</v-card-title>
            <v-card-text>
              <TextRender :txt-string="question.body" :show-image="true" />
            </v-card-text>
            <v-card-title>答え</v-card-title>
            <v-card-text>
              <v-radio-group v-model="answer" column>
                <template v-for="choice in question.choices">
                  <v-radio :key="choice.id" :value="choice.id">
                    <template v-slot:label>
                      <TextRender
                        :txt-string="choice.body"
                        :show-image="true"
                      />
                    </template>
                  </v-radio>
                </template>
              </v-radio-group>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" class="px-5" @click="checkAnswer">
                回答確定
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
  middleware: 'authenticated',
  async asyncData({ $axios, params, error }) {
    const postId = params.post_id
    const questionId = params.question_id
    const questionUrl = `/api/v1/posts/${postId}/questions/${questionId}`

    try {
      const response = await $axios.$get(questionUrl)

      const question = response.question
      const loading = false

      return { question, loading }
    } catch (err) {
      error({
        statusCode: err.response.status,
        message: err.response.data.message,
      })
    }
  },
  data() {
    return {
      answer: '',
    }
  },
  methods: {
    checkAnswer() {},
  },
}
</script>
