<template>
  <div>
    <!-- 公開 -->
    <template v-if="status === 'publish'">
      <status-icon color="green darken-1" icon="mdi-earth">
        公開
      </status-icon>
    </template>
    <!-- 非公開 -->
    <template v-else-if="status === 'draft'">
      <status-icon color="red darken-1" icon="mdi-pencil">
        非公開
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
