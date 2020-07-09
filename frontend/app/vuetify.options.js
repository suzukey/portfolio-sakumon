import colors from 'vuetify/es5/util/colors'
import SakumonIcon from '~/components/icons/Sakumon.vue'

export default {
  theme: {
    dark: false,
    themes: {
      dark: {
        primary: colors.cyan.darken3,
        accent: colors.amber.darken3,
        info: colors.teal.lighten1,
        warning: colors.amber.base,
        error: colors.deepOrange.accent4,
        success: colors.green.accent3,
      },
      light: {
        primary: colors.cyan.darken2,
        accent: colors.amber.darken2,
        info: colors.teal.lighten1,
        warning: colors.amber.base,
        error: colors.deepOrange.accent4,
        success: colors.green.accent3,
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
