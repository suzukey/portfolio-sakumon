<template>
  <div class="loading-list">
    <div v-for="n of count" :key="n" class="loading-list-item">
      <v-divider></v-divider>
      <v-skeleton-loader type="list-item-avatar-three-line"></v-skeleton-loader>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    count: {
      type: Number,
      default: 10,
    },
  },
}
</script>
