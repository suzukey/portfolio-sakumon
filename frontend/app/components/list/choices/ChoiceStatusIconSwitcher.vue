<template>
  <div>
    <!-- 公開 -->
    <template v-if="status === 'correct'">
      <StatusIcon
        color="green darken-1"
        icon="mdi-checkbox-marked-circle-outline"
      >
        正解
      </StatusIcon>
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
