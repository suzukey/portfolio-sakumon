<template>
  <v-app-bar
    v-click-outside="onClickOutside"
    app
    color="primary"
    dark
    :elevate-on-scroll="elevateOnScroll"
  >
    <template v-if="!showSearch">
      <v-toolbar-title>
        <nuxt-link
          to="/"
          class="title-link font-weight-medium d-flex align-center"
        >
          <v-icon large>$vuetify.icons.values.sakumon</v-icon>
          <span class="ml-2 d-none d-sm-inline">SakuMon</span>
        </nuxt-link>
      </v-toolbar-title>

      <v-spacer />

      <v-btn icon @click="toggleSearch">
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
      <v-btn icon class="mr-2" @click="toggleSearch">
        <v-icon>mdi-arrow-left</v-icon>
      </v-btn>
      <v-text-field
        v-model="searchText"
        autofocus
        clearable
        dense
        hide-details
        outlined
        single-line
        prepend-inner-icon="mdi-magnify"
        color="white"
        label="検索"
        @keyup.enter="submitSearch"
      ></v-text-field>
    </template>
  </v-app-bar>
</template>

<script>
import AccountMenu from '~/components/common/AccountMenu.vue'

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
      showSearch: false,
      searchText: '',
    }
  },
  computed: {
    isAuthenticated() {
      return false
    },
  },
  methods: {
    toggleSearch() {
      this.showSearch = !this.showSearch
    },
    onClickOutside() {
      this.showSearch = false
    },
    submitSearch() {
      this.searchText = this.searchText.replace(/\u3000/g, ' ')
      this.searchText = this.searchText.trim()
      if (this.searchText !== '') {
        this.$router.push({
          path: '/search',
          query: { q: this.searchText },
        })
        this.searchText = ''
        this.showSearch = false
      }
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
