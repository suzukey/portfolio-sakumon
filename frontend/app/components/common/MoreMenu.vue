<template>
  <v-menu offset-y>
    <template v-slot:activator="{ on, attrs }">
      <v-btn icon v-bind="attrs" class="ml-1" v-on="on">
        <template v-if="isAuthenticated">
          <v-avatar color="gray" size="36">
            <UserIcon :icon-url="iconUrl" />
          </v-avatar>
        </template>
        <template v-else>
          <v-icon>mdi-dots-vertical</v-icon>
        </template>
      </v-btn>
    </template>
    <div class="drop-menu">
      <v-list>
        <template v-if="isAuthenticated">
          <v-list-item>
            <v-list-item-content>
              <v-list-item-subtitle>{{ nickname }}</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
          <v-divider></v-divider>
          <v-list-item nuxt :to="`/users/${name}`">
            <v-list-item-icon>
              <v-icon>mdi-account-box</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>マイページ</v-list-item-title>
            </v-list-item-content>
            <v-list-item-action></v-list-item-action>
          </v-list-item>
          <v-list-item nuxt to="/settings/profile">
            <v-list-item-icon>
              <v-icon>mdi-cog</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>設定</v-list-item-title>
            </v-list-item-content>
            <v-list-item-action></v-list-item-action>
          </v-list-item>
          <v-list-item @click="logout">
            <v-list-item-icon>
              <v-icon>mdi-exit-to-app</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>ログアウト</v-list-item-title>
            </v-list-item-content>
            <v-list-item-action></v-list-item-action>
          </v-list-item>
          <v-divider></v-divider>
        </template>

        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-brightness-4</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>ダークテーマ</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action>
            <v-switch v-model="theme" @click.native.stop />
          </v-list-item-action>
        </v-list-item>
        <v-list-item nuxt to="/help">
          <v-list-item-icon>
            <v-icon>mdi-help-circle</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>ヘルプ</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action></v-list-item-action>
        </v-list-item>
      </v-list>
    </div>
  </v-menu>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  computed: {
    theme: {
      get() {
        return this.$vuetify.theme.dark
      },
      set(value) {
        this.$vuetify.theme.dark = value
        this.$cookies.set('theme', value ? 'dark' : 'light', {
          path: '/',
          maxAge: 60 * 60 * 24 * 365,
        })
      },
    },
    ...mapGetters('user', ['name', 'nickname', 'iconUrl']),
    ...mapGetters('auth', ['isAuthenticated']),
  },
  methods: {
    ...mapActions('auth', ['logout']),
  },
}
</script>

<style scoped>
.drop-menu {
  max-width: 250px;
}
</style>
