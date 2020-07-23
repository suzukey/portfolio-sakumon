export default ({ $axios, store }) => {
  $axios.onRequest((config) => {
    const accessToken = store.state.auth.accessToken
    const client = store.state.auth.client
    const uid = store.state.auth.uid

    // 認証情報を持っていた場合付加する
    if (accessToken && client && uid) {
      config.headers.common['access-token'] = accessToken
      config.headers.common.client = client
      config.headers.common.uid = uid
    }
  })

  $axios.onError(() => {})
}
