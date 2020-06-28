<template>
  <v-app-bar app color="cyan darken-2" dark>
    <v-toolbar-title class="d-none d-sm-flex font-weight-bold">
      SakuMon
    </v-toolbar-title>

    <v-spacer />

    <div v-if="isAuthenticated">
      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-square-edit-outline</v-icon>
      </v-btn>

      <v-btn icon>
        <v-avatar color="" size="48">
          <v-icon dark>mdi-account-circle</v-icon>
        </v-avatar>
      </v-btn>
    </div>
    <div v-else>
      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>

      <v-btn text>ログイン</v-btn>

      <v-btn outlined>新規登録</v-btn>
    </div>
  </v-app-bar>
</template>

<script>
export default {
  computed: {
    isAuthenticated() {
      return Math.random() >= 0.5
    },
  },
}
</script>
