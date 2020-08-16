<template>
  <v-card class="text-viewer-card">
    <v-card-subtitle>
      プレビュー
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
  },
}
</script>
