<template>
  <v-app-bar
    v-click-outside="onClickOutside"
    app
    color="primary"
    dark
    :elevate-on-scroll="elevateOnScroll"
  >
    <template v-if="!search">
      <v-toolbar-title class="d-none d-sm-flex">
        <nuxt-link to="/" class="title-link font-weight-medium">
          SakuMon
        </nuxt-link>
      </v-toolbar-title>

      <v-spacer />

      <v-btn icon @click="search = true">
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
    </template>
    <template v-else>
      <v-btn icon class="mr-2" @click="search = false">
        <v-icon>mdi-arrow-left</v-icon>
      </v-btn>
      <v-text-field
        autofocus
        clearable
        dense
        hide-details
        outlined
        single-line
        prepend-inner-icon="mdi-magnify"
        label="検索"
      ></v-text-field>
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
  data() {
    return {
      search: false,
    }
  },
  computed: {
    isAuthenticated() {
      return false
    },
  },
  methods: {
    onClickOutside() {
      this.search = false
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
