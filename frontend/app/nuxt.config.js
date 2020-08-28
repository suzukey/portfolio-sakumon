export default {
  /*
   ** Nuxt rendering mode
   ** See https://nuxtjs.org/api/configuration-mode
   */
  mode: 'universal',
  /*
   ** Nuxt target
   ** See https://nuxtjs.org/api/configuration-target
   */
  target: 'server',
  /*
   ** Headers of the page
   ** See https://nuxtjs.org/api/configuration-head
   */
  head: {
    htmlAttrs: {
      lang: 'ja',
    },
    titleTemplate: '%s | SakuMon',
    title: 'SakuMon',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content:
          'サクっと作る・解く問題集 あなたの知識のサポートに。 「自分で作って自分で解く」「他人の作った問題を解く」「自分で作って公開する」など使い方はあなた次第！',
      },
      { name: 'apple-mobile-web-app-title', content: 'Sakumon' },
      { name: 'application-name', content: 'SakuMon' },
      { name: 'msapplication-TileColor', content: '#00aba9' },
      { name: 'theme-color', content: '#ffffff' },
    ],
    link: [
      { rel: 'icon', type: 'image/svg+xmln', href: '/favicon.svg' },
      {
        rel: 'apple-touch-icon',
        sizes: '180x180',
        href: '/apple-touch-icon.png',
      },
      { rel: 'manifest', href: '/site.webmanifest' },
      { rel: 'mask-icon', href: '/safari-pinned-tab.svg', color: '#5bbad5' },
    ],
  },
  /*
   ** Global CSS
   */
  css: ['@/assets/common.css'],
  /*
   ** Plugins to load before mounting the App
   ** https://nuxtjs.org/guide/plugins
   */
  plugins: [{ src: '~/plugins/axios.js' }, { src: '~/plugins/renderer.js' }],
  /*
   ** Auto import components
   ** See https://nuxtjs.org/api/configuration-components
   */
  components: true,
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: [
    // Doc: https://github.com/nuxt-community/eslint-module
    '@nuxtjs/eslint-module',
    // Doc: https://github.com/nuxt-community/stylelint-module
    '@nuxtjs/stylelint-module',
    '@nuxtjs/vuetify',
    '@nuxtjs/moment',
  ],
  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    '@nuxtjs/svg',
    '@nuxtjs/toast',
    '@nuxtjs/markdownit',
  ],
  /*
   ** vue-router module configuration
   */
  router: {
    stringifyQuery: (query) => {
      const qs = require('qs')
      const result = qs.stringify(query, { format: 'RFC1738' })
      return result ? '?' + result : ''
    },
  },
  /*
   ** Axios module configuration
   ** See https://axios.nuxtjs.org/options
   */
  axios: {
    baseURL: 'http://rails-backend:3000/',
    browserBaseURL:
      process.env.NODE_ENV === 'production'
        ? 'https://portfolio.sakumon.me/'
        : 'https://sakumon.localhost/',
  },
  /*
   ** vuetify module configuration
   ** https://github.com/nuxt-community/vuetify-module
   */
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    optionsPath: './vuetify.options.js',
  },
  /*
   ** vue-toasted module configuration
   */
  toast: {
    position: 'bottom-right',
    duration: 3000,
    singleton: true,
  },
  /*
   ** markdown-it module configuration
   */
  markdownit: {
    injected: true,
    breaks: true,
    html: true,
  },
  moment: {
    locales: ['ja'],
  },
  /*
   ** Build configuration
   ** See https://nuxtjs.org/api/configuration-build/
   */
  build: {},
}
