export const state = () => ({
  post: {},
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
  progress(_, getters) {
    if (getters.totalQueCount === 0) return 0

    const progress = getters.nowQueCount / getters.totalQueCount
    return Math.floor(progress * 100)
  },
  progressCounter(_, getters) {
    return `${getters.nowQueCount} / ${getters.totalQueCount} `
  },
  existPostObject(state) {
    return Object.keys(state.post).length
  },
}

export const mutations = {
  setPost(state, post) {
    state.post = post
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
}
