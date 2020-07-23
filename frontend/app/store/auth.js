export const state = () => ({
  accessToken: '',
  client: '',
  uid: '',
})

export const getters = {
  isAuthenticated(state) {
    return !!state.accessToken
  },
}

export const mutations = {
  login(state, payload) {
    state.accessToken = payload['access-token']
    state.client = payload.client
    state.uid = payload.uid
  },

  logout(state) {
    state.accessToken = null
    state.client = null
    state.uid = null
  },
}

const credentialKeys = ['access-token', 'client', 'uid']
const pickCredential = (obj) =>
  Object.fromEntries(
    Object.entries(obj).filter(([key]) => credentialKeys.includes(key))
  )

export const actions = {
  async login({ commit }, payload) {
    await this.$axios
      .post('/api/v1/auth/sign_in', payload)
      .then((res) => {
        const headers = res.headers
        const credential = pickCredential(headers)

        commit('login', credential)
        this.$router.push('/')
      })
      .catch(() => {})
  },

  async register({ commit }, payload) {
    await this.$axios
      .post('/api/v1/auth', payload)
      .then((res) => {
        const headers = res.headers
        const credential = pickCredential(headers)

        commit('login', credential)
        this.$router.push('/')
      })
      .catch(() => {})
  },

  async logout({ commit }) {
    await this.$axios
      .$delete('/api/v1/auth/sign_out')
      .then(() => {
        commit('logout')
        this.$router.push('/')
      })
      .catch(() => {})
  },
}
