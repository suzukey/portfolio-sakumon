<template>
  <v-app>
    <v-main class="primary text-center white--text" style="min-width: 320px;">
      <v-container class="py-10">
        <v-row>
          <v-col col="12">
            <div class="title text-h3 text-sm-h2 font-weight-medium">
              <nuxt-link to="/">SakuMon</nuxt-link>
            </div>
            <div class="subtitle text-subtitle-2 text-sm-subtitle-1 mt-2">
              サクっと作る・解く問題集
            </div>
          </v-col>
        </v-row>
        <v-row>
          <v-col col="12">
            <v-card light class="ma-auto px-5 py-15" style="max-width: 440px;">
              <nuxt />
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<style scoped>
.title a {
  color: inherit;
  text-decoration: none;
}
</style>
