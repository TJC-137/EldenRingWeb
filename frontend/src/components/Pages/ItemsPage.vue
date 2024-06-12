<!-- ItemsPage.vue -->
<template>
  <div class="items-page">
    <h1>Categories</h1>
    <CategoryListAtom className="category" @categorySelected="handleCategorySelected" />
    <div :key="props.category">
        <TableAtom :category="props.category"/>
      </div>
    <section>
      <RouterView :category="selectedCategory" />
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, defineProps } from 'vue';
import CategoryListAtom from '../Atoms/CategoryListAtom.vue';
import TableAtom from '../Atoms/TableAtom.vue';

let selectedCategory = ref('');

const props = defineProps<{
  category: string;
}>();
const handleCategorySelected = (category: string) => {
  selectedCategory.value = category;
};
</script>

<style scoped>
.items-page {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
