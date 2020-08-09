<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <CreateQuestion :post-id="$route.params.id" />
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import CreateQuestion from '~/components/questions/CreateQuestion.vue'

export default {
  middleware: 'authenticated',
  components: {
    CreateQuestion,
  },
  head() {
    return {
      title: '新規問題',
    }
  },
}
</script>
