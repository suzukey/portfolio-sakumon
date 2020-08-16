<template>
  <v-card class="text-editor-card">
    <v-card-subtitle>
      問題文
    </v-card-subtitle>
    <v-divider></v-divider>
    <v-card-actions>
      <v-spacer></v-spacer>
      <!-- 隠れfile-input -->
      <input
        ref="file"
        type="file"
        hidden
        accept="image/jpeg, image/png"
        @change="selectedFile"
      />
      <v-btn icon @click="$refs.file.click()">
        <v-icon>mdi-image</v-icon>
      </v-btn>
      <v-btn icon>
        <v-icon>mdi-help-circle</v-icon>
      </v-btn>
    </v-card-actions>
    <v-divider></v-divider>
    <div class="text-editor">
      <v-textarea v-model="inputString" auto-grow filled />
    </div>
  </v-card>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
      required: true,
    },
    postId: {
      type: String,
      required: true,
    },
  },
  computed: {
    inputString: {
      get() {
        return this.value
      },
      set(val) {
        this.$emit('input', val)
      },
    },
  },
  methods: {
    async selectedFile() {
      const files = this.$refs.file.files
      // ファイルが存在しなければ早期リターン
      if (files.length <= 0) return

      const file = files[0]
      const formData = new FormData()
      formData.append('image', file)
      const postId = this.$route.params.post_id
      const url = `api/v1/posts/${postId}/images`

      try {
        const response = await this.$axios.$post(url, formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })

        const imageMd = `![${response.image.filename}](${response.image.url})`
        this.inputString += '\n' + imageMd
      } catch (err) {
        this.$toast.error('画像のアップロードに失敗しました')
      }
      // ファイルを選択解除
      this.$refs.file.value = ''
    },
  },
}
</script>
