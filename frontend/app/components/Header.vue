<template>
  <v-app-bar app color="primary" dark>
    <v-toolbar-title class="d-none d-sm-flex font-weight-medium">
      SakuMon
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
      <v-btn text>ログイン</v-btn>

      <v-btn outlined>新規登録</v-btn>
    </template>
  </v-app-bar>
</template>

<script>
import AccountMenu from '~/components/AccountMenu.vue'

export default {
  component: {
    AccountMenu,
  },
  computed: {
    isAuthenticated() {
      return true
    },
  },
}
</script>
