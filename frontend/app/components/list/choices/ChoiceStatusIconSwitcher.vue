<template>
  <div>
    <!-- 公開 -->
    <template v-if="status === 'correct'">
      <status-icon
        color="green darken-1"
        icon="mdi-checkbox-marked-circle-outline"
      >
        正解
      </status-icon>
    </template>
  </div>
</template>

<script>
import StatusIcon from '~/components/list/StatusIcon.vue'

export default {
  components: {
    StatusIcon,
  },
  props: {
    status: {
      type: String,
      required: true,
    },
  },
}
</script>
