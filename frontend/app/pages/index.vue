<template>
  <div class="home">
    <my-header :elevate-on-scroll="isShowAbout"></my-header>
    <v-main>
      <home-about v-if="isShowAbout"></home-about>
      <v-container>
        <v-row justify="center">
          <v-col cols="12">
            <trend-posts></trend-posts>
          </v-col>
        </v-row>
        <v-row justify="center">
          <v-col cols="12">
            <latest-posts></latest-posts>
          </v-col>
        </v-row>
        <scroll-to-top></scroll-to-top>
      </v-container>
    </v-main>
    <my-footer></my-footer>
  </div>
</template>

<script>
import MyHeader from '~/components/common/Header.vue'
import MyFooter from '~/components/common/Footer.vue'
import ScrollToTop from '~/components/common/ScrollToTop.vue'
import HomeAbout from '~/components/HomeAbout.vue'
import LatestPosts from '~/components/posts/LatestPosts.vue'
import TrendPosts from '~/components/posts/TrendPosts.vue'

export default {
  components: {
    MyHeader,
    MyFooter,
    ScrollToTop,
    HomeAbout,
    LatestPosts,
    TrendPosts,
  },
  computed: {
    isShowAbout() {
      return true
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
