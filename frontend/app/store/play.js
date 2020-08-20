export const state = () => ({
  post: {},
  answer: [],
  checked: {},
  checkedCount: 0,
  correctCount: 0,
  nowIndex: 0,
})

export const getters = {
  post(state) {
    return state.post
  },
  nowQuestion(state) {
    if (!getters.existPostObject) return {}
    return state.post.questions[state.nowIndex]
  },
  nowQueCount(state) {
    return state.nowIndex + 1
  },
  totalQueCount(state, getters) {
    if (!getters.existPostObject) return 0
    return state.post.questions.length
  },
  checkedCount(state) {
    return state.checkedCount
  },
  correctCount(state) {
    return state.correctCount
  },
  progress(_, getters) {
    if (getters.totalQueCount === 0) return 0

    const progress = getters.nowQueCount / getters.totalQueCount
    return Math.floor(progress * 100)
  },
  progressCounter(_, getters) {
    return `${getters.nowQueCount} / ${getters.totalQueCount}`
  },
  existPostObject(state) {
    return Object.keys(state.post).length
  },
  checked(state) {
    return state.checked
  },
  choicedBody(state, getters) {
    const answer = state.answer
    const choices = getters.nowQuestion.choices

    const tmp = answer.map((choiceId) => {
      const match = choices.find((choice) => choice.id === choiceId)
      if (match && 'body' in match) return match.body
    })
    return tmp
  },
  isLast(state, getters) {
    return state.checkedCount >= getters.totalQueCount
  },
}

export const mutations = {
  setPost(state, post) {
    state.post = post
    state.answer = []
    state.checked = {}
    state.checkedCount = 0
    state.correctCount = 0
    state.nowIndex = 0
  },
  setAnswer(state, answer) {
    state.answer = answer
  },
  setChecked(state, data) {
    state.checked = data
    state.checkedCount++
    if (data.result === 'correct') state.correctCount++
  },
  playNext(state) {
    state.nowIndex++
  },
}

export const actions = {
  async getPost({ commit }, postId) {
    try {
      const url = `/api/v1/posts/${postId}/play/start`
      const response = await this.$axios.$get(url)
      commit('setPost', response.post)
    } catch {
      this.$toast.error('問題集の取得に失敗しました')
    }
  },
  async checkAnswer({ commit, getters }, answer) {
    const postId = getters.post.id
    const questionId = getters.nowQuestion.id
    const url = `/api/v1/posts/${postId}/play/check`
    const params = {
      question_id: questionId,
      answer,
    }
    try {
      commit('setAnswer', answer)
      const response = await this.$axios.$post(url, params)
      commit('setChecked', response)
    } catch {
      this.$toast.error('答え合わせに失敗しました')
    }
  },
  playNext({ commit }) {
    commit('playNext')
  },
}
