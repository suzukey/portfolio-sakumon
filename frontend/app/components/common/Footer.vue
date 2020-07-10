<template>
  <v-footer absolute app color="primary" dark>
    <v-container class="footer-content text-center">
      <div class="footer-title mb-3">
        <div class="text-h6">
          <nuxt-link to="/">SakuMon</nuxt-link>
        </div>
        <div class="text-caption">サクっと作る・解く問題集</div>
      </div>

      <span class="text-caption">
        &copy; {{ new Date().getFullYear() }} SakuMon
      </span>
    </v-container>
  </v-footer>
</template>

<style scoped>
.footer-title a {
  color: inherit;
  text-decoration: none;
}
</style>
