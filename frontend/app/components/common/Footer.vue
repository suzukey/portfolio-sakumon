<template>
  <v-footer absolute app color="primary" dark>
    <v-container class="footer-content text-center">
      <div class="footer-title">
        <div class="text-h6">
          <nuxt-link to="/">SakuMon</nuxt-link>
        </div>
        <div class="text-caption">サクっと作る・解く問題集</div>
      </div>

      <div class="footer-links text-body-2 mt-3">
        <nuxt-link to="/help">ヘルプ</nuxt-link>
      </div>

      <div class="footer-copyright mt-3">
        <span class="text-caption">
          &copy; {{ new Date().getFullYear() }} SakuMon
        </span>
      </div>
    </v-container>
  </v-footer>
</template>

<style scoped>
.footer-title a {
  color: inherit;
  text-decoration: none;
}

.footer-links a {
  color: inherit;
}
</style>
