<template>
  <div>
    <!-- 公開 -->
    <template v-if="status === 'public'">
      <v-tooltip bottom>
        <template v-slot:activator="{ on, attrs }">
          <v-icon color="green darken-1" v-bind="attrs" v-on="on"
            >mdi-earth</v-icon
          >
        </template>
        <span>公開</span>
      </v-tooltip>
    </template>
    <!-- 限定公開 -->
    <template v-else-if="status === 'unlisted'">
      <v-tooltip bottom>
        <template v-slot:activator="{ on, attrs }">
          <v-icon color="yellow darken-3" v-bind="attrs" v-on="on"
            >mdi-link</v-icon
          >
        </template>
        <span>限定公開</span>
      </v-tooltip>
    </template>
    <!-- 非公開 -->
    <template v-else>
      <v-tooltip bottom>
        <template v-slot:activator="{ on, attrs }">
          <v-icon color="red red accent-1" v-bind="attrs" v-on="on"
            >mdi-lock</v-icon
          >
        </template>
        <span>非公開</span>
      </v-tooltip>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    status: {
      type: String,
      required: true,
    },
  },
}
</script>
