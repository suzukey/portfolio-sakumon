import colors from 'vuetify/es5/util/colors'
import SakumonIcon from '~/components/icons/Sakumon.vue'

export default {
  theme: {
    dark: false,
    themes: {
      dark: {
        primary: colors.cyan.darken3,
        accent: colors.amber.darken3,
      },
      light: {
        primary: colors.cyan.darken2,
        accent: colors.amber.darken2,
      },
    },
  },
  icons: {
    values: {
      sakumon: {
        component: SakumonIcon,
      },
    },
  },
}
