<template>
  <div class="text-body">
    <!-- eslint-disable-next-line vue/no-v-html -->
    <div v-html="$renderer.text(txtString, showImage)"></div>
  </div>
</template>

<script>
export default {
  props: {
    txtString: {
      type: String,
      required: true,
    },
    showImage: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style>
.text-body img {
  object-fit: scale-down;
  width: 100%;
}

.text-body p:last-child {
  margin-bottom: 0;
}
</style>
