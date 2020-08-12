<template>
  <div>
    <!-- 公開 -->
    <template v-if="status === 'public'">
      <status-icon color="green darken-1" icon="mdi-earth">
        公開
      </status-icon>
    </template>
    <!-- 限定公開 -->
    <template v-else-if="status === 'unlisted'">
      <status-icon color="yellow darken-3" icon="mdi-link">
        限定公開
      </status-icon>
    </template>
    <!-- 非公開 -->
    <template v-else-if="status === 'private'">
      <status-icon color="red darken-1" icon="mdi-lock">
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
