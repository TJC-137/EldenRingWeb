<!-- TableAtom.vue -->

<template>
  <div>
    <h2>{{ props.category }}</h2>
    <ul class="list" :key="props.category">
      <li v-if="Array.isArray(itemsData)" v-for="item in itemsData" :key="item.id">
        <BoxAtom 
          :itemId="item.id"
          :itemName="item.name" 
          :imageUrl="item.image" 
          className="box"  
          @itemClick="handleItemClick"
        />
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { defineProps, watchEffect } from 'vue';
import { useRouter } from 'vue-router';
import { useApi } from '../../api/composables/apiComposable';
import BoxAtom from '../Atoms/BoxAtom.vue';

const props = defineProps<{
  category: string;
}>();

const { itemsData, fetchItems } = useApi(props.category);

const router = useRouter();

const handleItemClick = (item: { itemId: string; itemName: string }) => {
  router.push({
    name: 'itemDetails',
    params: {
      category: props.category,
      itemId: item.itemId,
      itemName: item.itemName
    }
  });
  console.log("Clicked item:", item);
  console.log("Category:", props.category);
  console.log("Item ID:", item.itemId);
};

watchEffect(() => {
  console.log("Category changed:", props.category);
  console.log("Fetching items for category:", props.category);
  fetchItems();
});
</script>

<style scoped>
.list {
  list-style-type: none;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  padding: 0;
  margin: 0;
  gap: 20px;
  animation: fadeIn 3s;
}

.box {
  padding: 20px;
  margin: 20px;
  display: table;
  transition: transform 0.3s ease-in-out;
}

h2 {
  color: rgba(225, 198, 128, 0.852);
  text-align: center;
  text-shadow: 10% 10% 10% #3a3a3a;
  font-size: 28px;
}

.box:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

@keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
</style>
