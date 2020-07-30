<template>
  <div class="icon">
    <img :src="iconUrl" alt="UserIcon" />
    <v-overlay absolute color="rgba(255, 255, 255, 0)"></v-overlay>
  </div>
</template>

<script>
export default {
  props: {
    iconUrl: {
      type: String,
      default: '/account.png',
    },
  },
}
</script>

<style scoped>
.icon {
  display: flex;
  width: inherit;
  height: inherit;
  justify-content: center;
  align-items: center;
}
</style>
