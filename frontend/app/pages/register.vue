<template>
  <v-card-text>
    <page-selector active-page="register"></page-selector>
    <v-text-field
      v-model="credential.name"
      :counter="16"
      prepend-inner-icon="mdi-account"
      label="ユーザー名"
      autocomplete="off"
    />
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
    <p class="agrees text-left mt-7 mb-5">
      <span>アカウントを登録することにより、</span>
      <nuxt-link to="terms">利用規約</nuxt-link>
      <span>および</span>
      <nuxt-link to="privacy">プライバシーポリシー</nuxt-link>
      <span>に同意するものとします。</span>
    </p>
    <v-btn
      block
      color="primary"
      depressed
      x-large
      class="mb-0 mt-2"
      @click="registerProcess"
    >
      <span class="font-weight-bold text-subtitle-1">登録する</span>
    </v-btn>
    <easy-login />
  </v-card-text>
</template>

<script>
import { mapActions } from 'vuex'

import PageSelector from '~/components/auth/PageSelector.vue'
import EasyLogin from '~/components/auth/EasyLogin.vue'

export default {
  components: {
    PageSelector,
    EasyLogin,
  },
  data() {
    return {
      credential: {
        name: '',
        email: '',
        password: '',
      },
    }
  },
  computed: {
    addNicknameCredential() {
      const credential = {
        name: this.credential.name,
        nickname: this.credential.name,
        email: this.credential.email,
        password: this.credential.password,
      }
      return credential
    },
  },
  methods: {
    async registerProcess() {
      await this.register(this.addNicknameCredential)
    },
    ...mapActions('auth', ['register']),
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
