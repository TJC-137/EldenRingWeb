<template>
    <div class="item-list-page">
      <h3>Select an item:</h3>
      <ul class="item-list">
        <li v-for="item in items" :key="item.id" @click="goToItemDetails(item)">
          <div class="item">
            <p>{{ item.name }}</p>
            <img :src="item.image" />
          </div>
        </li>
      </ul>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, onMounted, watchEffect } from 'vue';
  import { useRoute, useRouter } from 'vue-router';
  import { useSearchApi } from '../../api/composables/searchApi';
  
  const route = useRoute();
  const router = useRouter();
  const { searchResults, searchInAllCategories } = useSearchApi();
  const items = ref(searchResults.value);
  
  const performSearch = async (query: string) => {
    await searchInAllCategories(query);
    items.value = searchResults.value;
  };
  
  onMounted(() => {
    const searchQuery = route.query.search as string;
    if (searchQuery) {
      performSearch(searchQuery);
    }
  });
  
  const goToItemDetails = (item: any) => {
    router.push({
      name: 'itemDetails',
      params: {
        category: item.category,
        itemId: item.id,
        itemName: item.name,
      },
    });
  };
  
  watchEffect(() => {
    items.value = searchResults.value;
  });
  </script>
  
  <style scoped>
  .item-list-page {
    width: 750px;
    margin: 0 auto;
    padding: 20px;
  }
  
  .item-list {
    list-style: none;
    padding: 0;
  }
  
  .item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #e1c680;
    margin-bottom: 10px;
    cursor: pointer;
  }
  
  .item img {
    width: 50px;
    height: 50px;
  }
  
  .item:hover {
    background-color: #333;
  }

  @media screen and (max-width: 1440px) {
    .item-list-page {
      width: 90%;
    }
    
  }

  @media screen and (max-width: 1280px) {
    .item-list-page {
      width: 90%;
    }
    
  }

  @media screen and (max-width: 1024px) {
    .item-list-page {
      width: 90%;
    }
    
  }

  @media screen and (max-width: 768px) {
    .item-list-page {
      width: 90%;
    }
    
  }
  </style>
  