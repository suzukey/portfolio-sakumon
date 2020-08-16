<template>
  <div class="text-body">
    <!-- eslint-disable-next-line vue/no-v-html -->
    <div v-html="$render.text(txtString, showImage)"></div>
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
</style>
