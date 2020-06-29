<template>
  <v-main>
    <v-container>
      <v-row justify="center">
        <v-col cols="12" sm="10" md="8" lg="6">
          <v-card>
            <v-card-title>エラー</v-card-title>
            <v-card-subtitle v-if="error.statusCode === 404">
              {{ pageNotFound }}
            </v-card-subtitle>
            <v-card-subtitle v-else>
              {{ otherError }}
            </v-card-subtitle>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn text nuxt to="/">ホームに戻る</v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
export default {
  props: {
    error: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      pageNotFound: '404 Not Found',
      otherError: 'An error occurred',
    }
  },
  head() {
    const title =
      this.error.statusCode === 404 ? this.pageNotFound : this.otherError
    return {
      title,
    }
  },
}
</script>

<style scoped>
h1 {
  font-size: 20px;
}
</style>
