<template>
  <v-btn
    block
    color="primary"
    outlined
    x-large
    class="mb-0 mt-2"
    @click="easyLogin"
  >
    <span class="font-weight-bold text-subtitle-1">かんたんログイン</span>
  </v-btn>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  methods: {
    async easyLogin() {
      const credential = this.createCredential()
      await this.register({ ...credential })
    },

    ...mapActions('auth', ['register']),

    // 認証情報を作成する
    createCredential() {
      const userId = this.randomString(10)

      const credential = {}
      credential.name = userId
      credential.email = userId + '@example.com'
      credential.nickname = this.getRandomNickname()
      credential.password = this.randomString(8)

      return credential
    },
    randomString(length) {
      return Math.random()
        .toString(36)
        .slice(-1 * length)
    },

    getRandomNickname() {
      const nameList = [
        'サトシ',
        'さとし',
        'マモル',
        'まもる',
        'ユウキ',
        'ゆうき',
        'ノゾミ',
        'のぞみ',
        'ヒカリ',
        'ひかり',
        'コダマ',
        'こだま',
      ]

      const randomPick = (randArray) => {
        let picked = ''
        const arrayLength = randArray.length
        if (arrayLength > 0) {
          const randomIndex = Math.floor(Math.random() * arrayLength)
          picked = randArray[randomIndex]
        }
        return picked
      }

      const nickname = randomPick(nameList) || 'User'
      return nickname
    },
  },
}
</script>
