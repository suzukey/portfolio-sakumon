export default function ({ app }) {
  if (!process.server) return

  const theme = app.$cookies.get('theme')
  const themeIsDark = theme === 'dark'

  app.context.$vuetify.theme.dark = themeIsDark
}
