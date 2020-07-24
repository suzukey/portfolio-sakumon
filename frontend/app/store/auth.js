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

export const actions = {
  async login({ commit }, payload) {
    await this.$axios
      .post('/api/v1/auth/sign_in', payload)
      .then((res) => {
        loginProcess(commit, res)
        this.$router.push('/')
      })
      .catch(() => {})
  },

  async register({ commit }, payload) {
    await this.$axios
      .post('/api/v1/auth', payload)
      .then((res) => {
        loginProcess(commit, res)
        this.$router.push('/')
      })
      .catch(() => {})
  },

  async logout({ commit }) {
    await this.$axios
      .$delete('/api/v1/auth/sign_out')
      .then(() => {
        commit('logout')
        commit('user/revertUserInfo', { root: true })
        this.$router.push('/')
      })
      .catch(() => {})
  },
}

// 独自
const credentialKeys = ['access-token', 'client', 'uid']
const userInfoKeys = ['name', 'nickname', 'iconUrl']

const pickObject = (obj, keys) =>
  Object.fromEntries(Object.entries(obj).filter(([key]) => keys.includes(key)))

const loginProcess = (commit, res) => {
  const credential = pickObject(res.headers, credentialKeys)
  const userInfo = pickObject(res.data.data, userInfoKeys)

  commit('login', credential)
  commit('user/setUserInfo', userInfo, { root: true })
}
