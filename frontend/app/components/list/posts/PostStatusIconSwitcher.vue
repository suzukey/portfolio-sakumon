<template>
  <div>
    <!-- 公開 -->
    <template v-if="status === 'public'">
      <StatusIcon color="green darken-1" icon="mdi-earth">
        公開
      </StatusIcon>
    </template>
    <!-- 限定公開 -->
    <template v-else-if="status === 'unlisted'">
      <StatusIcon color="yellow darken-3" icon="mdi-link">
        限定公開
      </StatusIcon>
    </template>
    <!-- 非公開 -->
    <template v-else-if="status === 'private'">
      <StatusIcon color="red darken-1" icon="mdi-lock">
        非公開
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
