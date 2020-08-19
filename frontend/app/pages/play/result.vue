<template>
  <v-main v-if="existPostObject">
    <v-container>
      <v-row>
        <v-col>
          <v-card>
            <v-card-title>
              {{ post.title }}
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters('play', ['post', 'existPostObject']),
  },
  created() {
    // 空だったらトップに戻る
    if (!this.existPostObject) {
      this.$router.replace('/')
    }
  },
  head() {
    return {
      title: '問題集結果',
    }
  },
}
</script>
