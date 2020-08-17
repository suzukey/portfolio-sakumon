<template>
  <v-card class="choice-viewer-card">
    <v-card-subtitle>
      {{ title }}
    </v-card-subtitle>
    <v-divider></v-divider>
    <v-card-text class="choice-viewer">
      <v-checkbox input-value="true" value>
        <template v-slot:label>
          <TextRender :txt-string="txtString" :show-image="true" />
        </template>
      </v-checkbox>
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
.choice-viewer-card {
  overflow: hidden;
}

.choice-viewer {
  height: calc(100% - 55px);
  overflow-x: hidden;
  overflow-y: auto;
}
</style>

<style>
.choice-viewer p:last-child {
  margin-bottom: 0;
}
</style>
