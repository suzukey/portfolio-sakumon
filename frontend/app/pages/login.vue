<template>
  <v-card-text>
    <PageSelector active-page="login" />
    <v-text-field
      v-model="credential.email"
      prepend-inner-icon="mdi-email"
      label="メールアドレス"
      autocomplete="off"
    />
    <v-text-field
      v-model="credential.password"
      type="password"
      prepend-inner-icon="mdi-lock"
      label="パスワード"
      autocomplete="off"
    />
    <v-checkbox
      v-model="autoLogin"
      hide-details
      class="mt-7 mb-5"
      label="ログインしたままにする"
    ></v-checkbox>
    <v-btn
      block
      color="primary"
      depressed
      x-large
      class="mb-0 mt-2"
      @click="loginProcess"
    >
      <span class="font-weight-bold text-subtitle-1">ログイン</span>
    </v-btn>
    <EasyLogin />
    <p class="forgot text-right mb-0 mt-5">
      <nuxt-link to="forgot-password">パスワードを忘れた場合</nuxt-link>
    </p>
  </v-card-text>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      credential: {
        email: '',
        password: '',
      },

      autoLogin: false,
    }
  },
  methods: {
    async loginProcess() {
      await this.login(this.credential)
    },
    ...mapActions('auth', ['login']),
  },
  head() {
    return {
      title: 'ログイン',
    }
  },
  layout: 'auth',
}
</script>

<style scoped>
.forgot a {
  text-decoration: none;
}
</style>
