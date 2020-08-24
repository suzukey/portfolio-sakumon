<template>
  <div class="choices-list">
    <!-- 複数選択の場合 -->
    <template v-if="type === 'multiple'">
      <div v-for="choice in choices" :key="choice.id" class="choice-list-item">
        <v-checkbox v-model="checkboxSelected" :value="choice.id" hide-details>
          <template v-slot:label>
            <div class="text-body">
              <!-- eslint-disable-next-line vue/no-v-html -->
              <div v-html="$renderer.text(choice.body, showImage)"></div>
            </div>
          </template>
        </v-checkbox>
      </div>
    </template>
    <!-- 単一選択の場合 -->
    <template v-else-if="type === 'single'">
      <v-radio-group v-model="radioSelected" column hide-details>
        <template v-for="choice in choices">
          <v-radio :key="choice.id" :value="choice.id" class="choice-list-item">
            <template v-slot:label>
              <div class="text-body">
                <!-- eslint-disable-next-line vue/no-v-html -->
                <div v-html="$renderer.text(choice.body, showImage)"></div>
              </div>
            </template>
          </v-radio>
        </template>
      </v-radio-group>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: Array,
      required: true,
    },
    type: {
      type: String,
      required: true,
    },
    choices: {
      type: Array,
      required: true,
    },
    showImage: {
      type: Boolean,
      default: true,
    },
  },
  computed: {
    checkboxSelected: {
      get() {
        return this.value
      },
      set(val) {
        this.$emit('input', val)
      },
    },
    radioSelected: {
      get() {
        return this.value[0]
      },
      set(val) {
        const value = []
        value.push(val)
        this.$emit('input', value)
      },
    },
  },
}
</script>
