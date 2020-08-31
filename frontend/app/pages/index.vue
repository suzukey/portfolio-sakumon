<template>
  <div class="home">
    <MyHeader :elevate-on-scroll="isShowAbout" />
    <v-main>
      <HomeAbout v-if="isShowAbout" />
      <v-container>
        <v-row justify="center">
          <v-col cols="12">
            <TrendPosts />
          </v-col>
        </v-row>
        <v-row justify="center">
          <v-col cols="12">
            <LatestPosts />
          </v-col>
        </v-row>
        <ScrollToTop />
      </v-container>
    </v-main>
    <MyFooter />
  </div>
</template>

<script>
export default {
  computed: {
    isShowAbout() {
      // 認証前のみ表示する
      return !this.$store.getters['auth/isAuthenticated']
    },
  },
  head() {
    return {
      titleTemplate: '',
    }
  },
  layout: 'customizable',
}
</script>
