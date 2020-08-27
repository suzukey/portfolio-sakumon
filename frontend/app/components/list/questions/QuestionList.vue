<template>
  <div class="posts-list">
    <template v-if="loading">
      <Skeletons :count="10" />
    </template>
    <template v-else-if="existQuestions">
      <div
        v-for="question in questions"
        :key="question.id"
        class="posts-list-item"
      >
        <v-divider></v-divider>
        <QuestionListItem :post-id="post.id" :question="question" />
      </div>
    </template>
    <template v-else>
      <div class="not-exist">
        <v-divider></v-divider>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>{{ noRecord }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </div>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
    questions: {
      type: Array,
      required: true,
    },
    loading: {
      type: Boolean,
      required: true,
    },
    noRecord: {
      type: String,
      default: '問題がありません',
    },
  },
  computed: {
    existQuestions() {
      return this.questions && this.questions.length > 0
    },
  },
}
</script>
