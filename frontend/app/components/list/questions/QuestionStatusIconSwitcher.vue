<template>
  <div>
    <!-- 公開 -->
    <template v-if="status === 'publish'">
      <StatusIcon color="green darken-1" icon="mdi-earth">
        公開
      </StatusIcon>
    </template>
    <!-- 非公開 -->
    <template v-else-if="status === 'draft'">
      <StatusIcon color="red darken-1" icon="mdi-pencil">
        下書き
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
