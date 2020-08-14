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
      <v-radio-group v-model="post.status" row>
        <v-radio label="公開" value="public"></v-radio>
        <v-radio label="限定公開" value="unlisted"></v-radio>
        <v-radio label="非公開" value="private"></v-radio>
      </v-radio-group>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn
        color="primary"
        :disabled="!isChanged"
        class="px-7"
        @click="savePost"
      >
        保存
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      currentPost: {},
    }
  },
  computed: {
    isChanged() {
      const postJson = JSON.stringify(this.post)
      const currentPostJson = JSON.stringify(this.currentPost)
      return postJson !== currentPostJson
    },
  },
  created() {
    this.updatedPost()
  },
  methods: {
    updatedPost() {
      this.currentPost = Object.assign({}, this.post)
    },
    async savePost() {
      const postUrl = `/api/v1/posts/${this.post.id}`
      const postInfo = {
        title: this.post.title,
        body: this.post.body,
        status: this.post.status,
      }
      await this.$axios
        .put(postUrl, postInfo)
        .then((res) => {
          this.$toast.success('保存しました')
          this.updatedPost()
        })
        .catch(() => {
          this.$toast.error('保存に失敗しました')
        })
    },
  },
}
</script>
