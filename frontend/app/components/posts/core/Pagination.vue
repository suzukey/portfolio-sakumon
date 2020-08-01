<template>
  <div v-if="showPagination" class="pagination">
    <v-divider class="mb-1"></v-divider>
    <v-list-item-content class="text-center">
      <div class="d-none d-sm-block">
        <v-pagination
          v-model="currentPage"
          :length="length"
          :total-visible="7"
        ></v-pagination>
      </div>
      <div class="d-block d-sm-none">
        <v-btn icon :disabled="canMove.prev" @click="currentPage--">
          <v-icon>mdi-chevron-left</v-icon>
        </v-btn>
        <span class="mx-1">{{ currentPage }} / {{ length }}</span>
        <v-btn icon :disabled="canMove.next" @click="currentPage++">
          <v-icon>mdi-chevron-right</v-icon>
        </v-btn>
      </div>
    </v-list-item-content>
  </div>
</template>

<script>
export default {
  props: {
    length: {
      type: Number,
      required: true,
    },
    page: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      currentPage: 1,
    }
  },
  computed: {
    showPagination() {
      return isFinite(this.length) && this.length > 0
    },
    canMove() {
      const canPrev = this.currentPage > 1
      const canNext = this.currentPage < this.length
      return { prev: !canPrev, next: !canNext }
    },
  },
  watch: {
    currentPage() {
      const currentQuery = Object.assign({}, this.$route.query)
      delete currentQuery.page
      if (this.currentPage === 1) {
        this.$router.push({ query: { ...currentQuery } })
      } else {
        this.$router.push({
          query: {
            ...currentQuery,
            page: this.currentPage,
          },
        })
      }
    },
  },
  mounted() {
    this.currentPage = this.page
  },
}
</script>

<style scoped>
.pagination {
  user-select: none;
}
</style>

<style>
.v-pagination__item:focus,
.v-pagination__navigation:focus {
  outline: 0;
}
</style>
