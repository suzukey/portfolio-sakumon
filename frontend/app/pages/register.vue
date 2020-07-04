<template>
  <v-card-text>
    <page-selector active-page="register"></page-selector>
    <v-form @submit.prevent="submit">
      <v-text-field
        v-model="name"
        :counter="10"
        prepend-inner-icon="mdi-account"
        label="ユーザー名"
      />
      <v-text-field
        v-model="email"
        :counter="10"
        prepend-inner-icon="mdi-email"
        label="メールアドレス"
      />
      <v-text-field
        v-model="password"
        type="password"
        :counter="10"
        prepend-inner-icon="mdi-lock"
        label="パスワード"
      />
      <v-btn type="submit" block color="primary" x-large class="mt-10">
        <span class="font-weight-bold text-h6">登録する</span>
      </v-btn>
    </v-form>
  </v-card-text>
</template>

<script>
import PageSelector from '~/components/auth/PageSelector.vue'

export default {
  components: {
    PageSelector,
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
