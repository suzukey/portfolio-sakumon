<template>
  <v-app-bar app color="primary" dark>
    <v-toolbar-title class="font-weight-medium d-flex align-center">
      <v-icon large>$vuetify.icons.values.sakumon</v-icon>
      <span class="ml-2 d-none d-sm-inline">SakuMon</span>
    </v-toolbar-title>

    <v-spacer />

    <v-btn text class="px-4" @click="finish">
      途中終了して採点
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  methods: {
    finish() {
      this.$router.push('/play/result')
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
