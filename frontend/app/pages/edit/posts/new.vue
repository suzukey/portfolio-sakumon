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
export default {
  middleware: 'authenticated',
  head() {
    return {
      title: '新規投稿',
    }
  },
}
</script>
