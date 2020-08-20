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
            <v-card-subtitle class="font-weight-bold">
              正解
            </v-card-subtitle>
            <v-card-text>
              <template v-if="correctChoices.length">
                <div v-for="(choice, idx) in correctChoices" :key="idx">
                  <TextRender :txt-string="choice" :show-image="true" />
                </div>
              </template>
              <template v-else>
                <div>
                  なし
                </div>
              </template>
            </v-card-text>
            <v-card-subtitle class="font-weight-bold">
              あなたの回答
            </v-card-subtitle>
            <v-card-text>
              <template v-if="choicedBody.length">
                <div v-for="(choice, idx) in choicedBody" :key="idx">
                  <TextRender
                    v-if="choice"
                    :txt-string="choice"
                    :show-image="true"
                  />
                </div>
              </template>
              <template v-else>
                <div>
                  なし
                </div>
              </template>
            </v-card-text>
            <v-card-title>
              <template v-if="checked.result === 'correct'">
                正解
              </template>
              <template v-else>
                不正解
              </template>
            </v-card-title>
            <v-divider></v-divider>
            <v-card-subtitle class="font-weight-bold">
              問題
            </v-card-subtitle>
            <v-card-text>
              <TextRender :txt-string="nowQuestion.body" :show-image="true" />
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <template v-if="!isLast">
                <v-btn color="primary" class="px-5" @click="next">次へ</v-btn>
              </template>
              <template v-else>
                <v-btn color="primary" class="px-5" @click="result">
                  結果確認
                </v-btn>
              </template>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card>
            <v-card-text>
              <div class="progress mb-2">
                <v-progress-linear v-model="progress"></v-progress-linear>
              </div>
              <div class="counter text-right">
                <span>{{ progressCounter }}</span>
              </div>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  layout: 'playing',
  data() {
    return {
      selected: [],
    }
  },
  computed: {
    correctChoices() {
      return this.checked.correct_choices
    },
    ...mapGetters('play', [
      'post',
      'nowQuestion',
      'progress',
      'progressCounter',
      'existPostObject',
      'checked',
      'choicedBody',
      'isLast',
    ]),
  },
  created() {
    // 空だったらトップに戻る
    if (!this.existPostObject) {
      this.$router.replace('/')
    }
  },
  methods: {
    next() {
      this.playNext()
      this.$router.replace('/play')
    },
    result() {
      this.$router.replace('/play/result')
    },
    ...mapActions('play', ['playNext']),
  },
  head() {
    return {
      title: '問題集',
    }
  },
}
</script>
