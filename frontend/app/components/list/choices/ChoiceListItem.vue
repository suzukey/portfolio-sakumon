<template>
  <v-list-item
    nuxt
    class="choice-list-item py-1"
    @click="$router.push({ path: `${choiceLink}` })"
  >
    <!-- 可視性表示 -->
    <v-list-item-avatar>
      <status-icon-switcher :status="choice.correct ? 'correct' : ''" />
    </v-list-item-avatar>

    <!-- 投稿内容 -->
    <v-list-item-content>
      <!-- タイトル -->
      <v-list-item-title>
        <nuxt-link :to="choiceLink" class="question-title" @click.native.stop>
          {{ choice.body }}
        </nuxt-link>
      </v-list-item-title>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
import StatusIconSwitcher from '~/components/list/choices/ChoiceStatusIconSwitcher.vue'

export default {
  components: {
    StatusIconSwitcher,
  },
  props: {
    postId: {
      type: String,
      required: true,
    },
    questionId: {
      type: String,
      required: true,
    },
    choice: {
      type: Object,
      required: true,
    },
  },
  computed: {
    choiceLink() {
      const postId = this.postId
      const questionId = this.questionId
      const choiceId = this.choice.id
      return `/edit/posts/${postId}/questions/${questionId}/choices/${choiceId}`
    },
  },
}
</script>

<style scoped>
.question-icon,
.question-title,
.question-author {
  color: inherit;
  text-decoration: none;
}

.question-author:hover {
  text-decoration: underline;
}
</style>
