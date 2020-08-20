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
      <v-row>
        <v-col>
          <v-card class="py-2">
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="6">
                    <p class="font-weight-bold">
                      正解数
                    </p>
                    <p>
                      {{ correctCounter }}
                    </p>
                  </v-col>
                  <v-col cols="6">
                    <p class="font-weight-bold">
                      正解率
                    </p>
                    <p>
                      {{ accuracyRate }}
                    </p>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="6">
                    <p class="font-weight-bold">
                      全体正解数
                    </p>
                    <p>
                      {{ totalCorrectCounter }}
                    </p>
                  </v-col>
                  <v-col cols="6">
                    <p class="font-weight-bold">
                      全体正解率
                    </p>
                    <p>
                      {{ totalAccuracyRate }}
                    </p>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" to="/" nuxt>
                トップに戻る
              </v-btn>
            </v-card-actions>
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
    correctCounter() {
      return `${this.correctCount} / ${this.checkedCount}`
    },
    accuracyRate() {
      let rate = this.correctCount / this.checkedCount
      rate = Math.round(rate * 1000) / 10
      return `${rate}%`
    },
    totalCorrectCounter() {
      return `${this.correctCount} / ${this.totalQueCount}`
    },
    totalAccuracyRate() {
      let rate = this.correctCount / this.totalQueCount
      rate = Math.round(rate * 1000) / 10
      return `${rate}%`
    },
    ...mapGetters('play', [
      'post',
      'existPostObject',
      'checkedCount',
      'correctCount',
      'totalQueCount',
    ]),
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
