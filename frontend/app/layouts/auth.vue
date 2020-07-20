<template>
  <v-app>
    <v-main class="primary" style="min-width: 320px;">
      <v-container class="py-10">
        <v-row class="text-center white--text">
          <v-col col="12">
            <div class="title text-h3 text-sm-h2 font-weight-medium">
              <nuxt-link to="/" class="d-flex align-center justify-center">
                <v-icon x-large>$vuetify.icons.values.sakumon</v-icon>
                <span class="ml-3">SakuMon</span>
              </nuxt-link>
            </div>
            <div class="subtitle text-subtitle-2 text-sm-subtitle-1 mt-2">
              サクっと作る・解く問題集
            </div>
          </v-col>
        </v-row>
        <v-row>
          <v-col col="12">
            <v-card
              light
              class="ma-auto px-5 py-7 py-sm-12"
              style="max-width: 440px;"
            >
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
