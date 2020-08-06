<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <v-card class="py-2">
            <v-row align="center" justify="center" class="pt-7 pb-5">
              <v-avatar size="100">
                <user-icon :icon-url="user.iconUrl"></user-icon>
                <v-overlay absolute z-index="3">
                  <v-btn icon @click="selectImage">
                    <v-icon>mdi-camera</v-icon>
                  </v-btn>
                </v-overlay>
              </v-avatar>
            </v-row>
            <v-card-text>
              <v-text-field
                v-model="user.nickname"
                label="ニックネーム"
                :counter="32"
              />
              <v-textarea
                v-model="user.profile"
                label="プロフィール"
                :counter="128"
                auto-grow
                row-height="20"
                rows="3"
              />
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="primary"
                :disabled="!isChanged"
                class="px-7"
                @click="saveUserInfo"
                >保存</v-btn
              >
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import { mapActions } from 'vuex'

import UserIcon from '~/components/common/UserIcon.vue'

export default {
  middleware: 'authenticated',
  components: {
    UserIcon,
  },
  async asyncData({ $axios, error }) {
    const userUrl = `/api/v1/me/profile`

    try {
      const userResponse = await $axios.$get(userUrl)

      const user = userResponse.user
      const currentUser = Object.assign({}, user)
      const loading = false

      return { user, currentUser, loading }
    } catch (err) {
      error(
        error({
          statusCode: err.response.status,
          message: err.response.data.message,
        })
      )
    }
  },
  data() {
    return {
      user: {},
      currentUser: [],
      loading: true,
    }
  },
  computed: {
    isChanged() {
      const userJson = JSON.stringify(this.user)
      const currentUserJson = JSON.stringify(this.currentUser)
      return userJson !== currentUserJson
    },
  },
  methods: {
    async saveUserInfo() {
      const userInfo = {
        name: this.user.name,
        nickname: this.user.nickname,
        profile: this.user.profile,
      }
      await this.setUserInfo(userInfo)
    },
    selectImage() {
      this.$toast.info('近日実装')
    },
    ...mapActions('user', ['setUserInfo']),
  },
  head() {
    return {
      title: '設定',
    }
  },
}
</script>
