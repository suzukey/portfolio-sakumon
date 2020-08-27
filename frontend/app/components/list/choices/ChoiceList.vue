<template>
  <div class="choice-list">
    <template v-if="loading">
      <Skeletons :count="10" />
    </template>
    <template v-else-if="existChoices">
      <div v-for="choice in choices" :key="choice.id" class="choice-list-item">
        <v-divider></v-divider>
        <ChoiceListItem
          :post-id="postId"
          :question-id="question.id"
          :choice="choice"
        />
      </div>
    </template>
    <template v-else>
      <div class="not-exist">
        <v-divider></v-divider>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>{{ noRecord }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </div>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    postId: {
      type: String,
      required: true,
    },
    question: {
      type: Object,
      required: true,
    },
    choices: {
      type: Array,
      required: true,
    },
    loading: {
      type: Boolean,
      required: true,
    },
    noRecord: {
      type: String,
      default: '選択肢がありません',
    },
  },
  computed: {
    existChoices() {
      return this.choices && this.choices.length > 0
    },
  },
}
</script>
