<template>
  <v-menu offset-y>
    <template v-slot:activator="{ on, attrs }">
      <v-btn icon v-bind="attrs" v-on="on">
        <v-avatar color="" size="48">
          <v-icon dark>mdi-account-circle</v-icon>
        </v-avatar>
      </v-btn>
    </template>
    <v-list-item-group>
      <v-list>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-account-box</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>マイページ</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action></v-list-item-action>
        </v-list-item>
        <v-divider></v-divider>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-cog</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>設定</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action></v-list-item-action>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-help-circle</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>ヘルプ</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action></v-list-item-action>
        </v-list-item>
        <v-divider> </v-divider>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-exit-to-app</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>ログアウト</v-list-item-title>
          </v-list-item-content>
          <v-list-item-action></v-list-item-action>
        </v-list-item>
      </v-list>
    </v-list-item-group>
  </v-menu>
</template>
