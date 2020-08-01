export const state = () => ({
  name: '',
  nickname: '',
  iconUrl: '',
})

export const getters = {
  name(state) {
    return state.name
  },
  nickname(state) {
    return state.nickname
  },
  iconUrl(state) {
    return state.iconUrl
  },
}

export const mutations = {
  setUserInfo(state, payload) {
    state.name = payload.name
    state.nickname = payload.nickname
    state.iconUrl = payload.iconUrl
  },

  revertUserInfo(state) {
    state.name = ''
    state.nickname = ''
    state.iconUrl = ''
  },
}

export const actions = {
  async setUserInfo({ commit }, payload) {
    await this.$axios
      .put('/api/v1/auth', payload)
      .then((res) => {
        commit('setUserInfo', payload)
        this.$toast.success('保存しました')
      })
      .catch(() => {
        this.$toast.error('保存に失敗しました')
      })
  },
}
