<template>
  <v-card-text>
    <page-selector active-page="login"></page-selector>
    <v-form @submit.prevent="submit">
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
        <span class="font-weight-bold text-h6">ログイン</span>
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
      email: '',
      password: '',
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
