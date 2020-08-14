<template>
  <v-card class="py-2">
    <v-card-text>
      <v-text-field v-model="post.title" :counter="48" label="タイトル" />
      <v-textarea
        v-model="post.body"
        label="説明文"
        :counter="128"
        auto-grow
        row-height="20"
        rows="3"
      />
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn color="primary" class="px-7" @click="savePost">
        作成
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      post: {
        title: '',
        body: '',
      },
    }
  },
  methods: {
    async savePost() {
      const postUrl = `/api/v1/posts`
      const postInfo = {
        title: this.post.title,
        body: this.post.body,
        status: this.post.status,
      }
      await this.$axios
        .post(postUrl, postInfo)
        .then((res) => {
          this.$toast.success('作成しました')
          const postId = res.data.post.id
          this.$router.replace({ path: `/edit/posts/${postId}` })
        })
        .catch(() => {
          this.$toast.error('作成に失敗しました')
        })
    },
  },
}
</script>
