<template>
  <v-card-text>
    <page-selector active-page="register"></page-selector>
    <v-form @submit.prevent="submit">
      <v-text-field
        v-model="name"
        :counter="16"
        prepend-inner-icon="mdi-account"
        label="ユーザー名"
      />
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
      <p class="agrees text-left mt-7 mb-5">
        <span>アカウントを登録することにより、</span>
        <nuxt-link to="terms">利用規約</nuxt-link>
        <span>および</span>
        <nuxt-link to="privacy">プライバシーポリシー</nuxt-link>
        <span>に同意するものとします。</span>
      </p>
      <v-btn
        type="submit"
        block
        color="primary"
        depressed
        x-large
        class="mb-0 mt-2"
      >
        <span class="font-weight-bold text-subtitle-1">登録する</span>
      </v-btn>
      <easy-login />
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
      name: '',
      email: '',
      password: '',
    }
  },
  head() {
    return {
      title: '新規登録',
    }
  },
  layout: 'auth',
}
</script>

<style scoped>
.agrees a {
  text-decoration: none;
}
</style>
