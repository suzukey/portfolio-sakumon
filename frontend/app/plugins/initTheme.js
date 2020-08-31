export default function ({ app }) {
  const theme = app.$cookies.get('theme')
  const themeIsDark = theme === 'dark'

  app.context.$vuetify.theme.dark = themeIsDark

  // 有効期限の更新
  app.$cookies.set('theme', themeIsDark ? 'dark' : 'light', {
    path: '/',
    maxAge: 60 * 60 * 24 * 365,
  })
}
