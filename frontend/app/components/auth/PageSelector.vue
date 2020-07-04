<template>
  <v-row align="center" justify="space-between" class="auth-titles mb-5">
    <v-col
      col="6"
      class="login text-left"
      :class="{
        'primary--text': isLoginPage,
        'text-h5': isLoginPage,
        'text-h6': !isLoginPage,
        'text-sm-h4': isLoginPage,
        'text-sm-h5': !isLoginPage,
        'font-weight-black': isLoginPage,
      }"
    >
      <nuxt-link to="/login">ログイン</nuxt-link>
    </v-col>
    <v-col
      col="6"
      class="register text-right"
      :class="{
        'primary--text': isRegisterPage,
        'text-h5': isRegisterPage,
        'text-h6': !isRegisterPage,
        'text-sm-h4': isRegisterPage,
        'text-sm-h5': !isRegisterPage,
        'font-weight-black': isRegisterPage,
      }"
    >
      <nuxt-link to="/register">新規登録</nuxt-link>
    </v-col>
  </v-row>
</template>

<script>
export default {
  props: {
    activePage: {
      type: String,
      default: '',
      require: true,
    },
  },
  computed: {
    isLoginPage() {
      return this.activePage === 'login'
    },
    isRegisterPage() {
      return this.activePage === 'register'
    },
  },
}
</script>

<style scoped>
.auth-titles a {
  color: inherit;
  text-decoration: none;
}
</style>
