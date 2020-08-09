<template>
  <v-tooltip bottom>
    <template v-slot:activator="{ on, attrs }">
      <v-icon :color="color" v-bind="attrs" v-on="on">{{ icon }}</v-icon>
    </template>
    <span><slot>公開ステータス</slot></span>
  </v-tooltip>
</template>

<script>
export default {
  props: {
    color: {
      type: String,
      required: true,
    },
    icon: {
      type: String,
      required: true,
    },
  },
}
</script>
