<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <CreatePost />
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import CreatePost from '~/components/posts/CreatePost.vue'

export default {
  middleware: 'authenticated',
  components: {
    CreatePost,
  },
  head() {
    return {
      title: '新規投稿',
    }
  },
}
</script>
