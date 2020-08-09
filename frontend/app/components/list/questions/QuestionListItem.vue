<template>
  <v-list-item
    nuxt
    class="question-list-item py-1"
    @click="$router.push({ path: `${questionLink}` })"
  >
    <!-- 可視性表示 -->
    <v-list-item-avatar>
      <status-icon-switcher :status="question.status" />
    </v-list-item-avatar>

    <!-- 投稿内容 -->
    <v-list-item-content>
      <!-- タイトル -->
      <v-list-item-title>
        <nuxt-link :to="questionLink" class="post-title" @click.native.stop>
          {{ question.body }}
        </nuxt-link>
      </v-list-item-title>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
import StatusIconSwitcher from '~/components/list/questions/StatusIconSwitcher.vue'

export default {
  components: {
    StatusIconSwitcher,
  },
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
  computed: {
    questionLink() {
      const postId = this.postId
      const questionId = this.question.id
      return `/posts/${postId}/questions/${questionId}`
    },
  },
}
</script>

<style scoped>
.post-icon,
.post-title,
.post-author {
  color: inherit;
  text-decoration: none;
}

.post-author:hover {
  text-decoration: underline;
}
</style>
