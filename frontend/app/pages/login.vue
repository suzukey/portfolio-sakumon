<template>
  <v-card-text>
    <page-selector active-page="login"></page-selector>
    <v-form @submit.prevent="submit">
      <v-text-field
        v-model="email"
        prepend-inner-icon="mdi-email"
        label="メールアドレス"
      />
      <v-text-field
        v-model="password"
        type="password"
        prepend-inner-icon="mdi-lock"
        label="パスワード"
      />
      <v-checkbox
        v-model="autoLogin"
        hide-details
        class="mt-7 mb-5"
        label="ログインしたままにする"
      ></v-checkbox>
      <v-btn
        type="submit"
        block
        color="primary"
        depressed
        x-large
        class="mb-0 mt-2"
      >
        <span class="font-weight-bold text-subtitle-1">ログイン</span>
      </v-btn>
      <easy-login />
      <p class="forgot text-right mb-0 mt-5">
        <nuxt-link to="forgot-password">パスワードを忘れた場合</nuxt-link>
      </p>
    </v-form>
  </v-card-text>
</template>

<script>
import PageSelector from '~/components/auth/PageSelector.vue'
import EasyLogin from '~/components/auth/EasyLogin.vue'

export default {
  components: {
    PageSelector,
    EasyLogin,
  },
  data() {
    return {
      email: '',
      password: '',
      autoLogin: false,
    }
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
