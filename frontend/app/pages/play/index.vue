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
              問題
            </v-card-subtitle>
            <v-card-text>
              <TextRender :txt-string="nowQuestion.body" :show-image="true" />
            </v-card-text>
            <v-card-subtitle class="font-weight-bold">
              選択肢
            </v-card-subtitle>
            <v-card-text>
              <ChoicesRender
                v-model="selected"
                :choices="nowQuestion.choices"
                :type="nowQuestion.type"
              />
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" class="px-5" @click="answer">回答</v-btn>
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
    ...mapGetters('play', [
      'post',
      'nowQuestion',
      'progress',
      'progressCounter',
      'existPostObject',
    ]),
  },
  created() {
    // 空だったらトップに戻る
    if (!this.existPostObject) {
      this.$router.replace('/')
    }
  },
  methods: {
    answer() {
      this.checkAnswer(this.selected)
      this.$router.replace('/play/check')
    },
    ...mapActions('play', ['checkAnswer']),
  },
  head() {
    return {
      title: '問題集',
    }
  },
}
</script>
