<template>
  <v-menu offset-y>
    <template v-slot:activator="{ on, attrs }">
      <v-btn icon v-bind="attrs" v-on="on">
        <v-avatar color="gray" size="48">
          <img v-if="iconUrl" :src="iconUrl" alt="Icon" />
          <v-icon v-else dark>mdi-account-circle</v-icon>
        </v-avatar>
      </v-btn>
    </template>
    <div class="drop-menu">
      <v-list>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-subtitle>{{ nickname }}</v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
        <v-divider></v-divider>
        <v-list-item nuxt to="/mypage">
          <v-list-item-icon>
            <v-icon>mdi-account-box</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>マイページ</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action></v-list-item-action>
        </v-list-item>
        <v-divider></v-divider>
        <v-list-item nuxt to="/settings">
          <v-list-item-icon>
            <v-icon>mdi-cog</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>設定</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action></v-list-item-action>
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
        <v-divider> </v-divider>
        <v-list-item @click="logout">
          <v-list-item-icon>
            <v-icon>mdi-exit-to-app</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>ログアウト</v-list-item-title>
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
    ...mapGetters('user', ['name', 'nickname', 'iconUrl']),
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
