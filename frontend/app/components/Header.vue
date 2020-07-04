<template>
  <v-app-bar app color="primary" dark :elevate-on-scroll="elevateOnScroll">
    <v-toolbar-title class="d-none d-sm-flex">
      <nuxt-link to="/" class="title-link font-weight-medium">
        SakuMon
      </nuxt-link>
    </v-toolbar-title>

    <v-spacer />

    <v-btn icon>
      <v-icon>mdi-magnify</v-icon>
    </v-btn>

    <template v-if="isAuthenticated">
      <v-btn icon>
        <v-icon>mdi-square-edit-outline</v-icon>
      </v-btn>

      <account-menu></account-menu>
    </template>
    <template v-else>
      <v-btn text nuxt to="/login">ログイン</v-btn>

      <v-btn outlined nuxt to="/register">新規登録</v-btn>
    </template>
  </v-app-bar>
</template>

<script>
import AccountMenu from '~/components/AccountMenu.vue'

export default {
  component: {
    AccountMenu,
  },
  props: {
    elevateOnScroll: {
      type: Boolean,
      default: false,
    },
  },
  computed: {
    isAuthenticated() {
      return false
    },
  },
}
</script>

<style scoped>
.title-link {
  color: inherit;
  text-decoration: none;
}
</style>
