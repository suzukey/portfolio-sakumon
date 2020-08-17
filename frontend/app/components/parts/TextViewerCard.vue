<template>
  <v-card class="text-viewer-card">
    <v-card-subtitle>
      {{ title }}
    </v-card-subtitle>
    <v-divider></v-divider>
    <v-card-text class="text-viewer">
      <TextRender :txt-string="txtString" :show-image="true" />
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    txtString: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      default: 'プレビュー',
    },
  },
}
</script>

<style scoped>
.text-viewer-card {
  overflow: hidden;
}

.text-viewer {
  height: calc(100% - 55px);
  overflow-x: hidden;
  overflow-y: auto;
}
</style>
