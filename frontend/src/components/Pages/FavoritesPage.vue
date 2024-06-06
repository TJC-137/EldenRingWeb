<template>
    <div class="item-list-page">
      <h3>Your Favorites:</h3>
      <ul class="item-list">
        <li v-for="favorite in favorites" :key="favorite.item_id" @click="goToItemDetails(favorite)">
          <div class="item">
            <p>{{ favorite.item_name }}</p>
            <img :src="favorite.item_image" />
          </div>
        </li>
      </ul>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, onMounted } from 'vue';
  import { useRoute, useRouter } from 'vue-router';
  import { useItemDetails } from '../../api/composables/useItemDetails';
  
  const route = useRoute();
  const router = useRouter();
  const favorites = ref([]);
  const { fetchFavoriteItemDetails } = useItemDetails();
  
  const fetchFavoriteDetails = async (favorite) => {
    try {
      const category = favorite.category.toLowerCase();
      const itemId = favorite.itemId;  // Asegúrate de que esto coincide con tu modelo y migración
      const itemDetails = await fetchFavoriteItemDetails(category, itemId);
      favorite.item_name = itemDetails?.name || "Unknown Item";
      favorite.item_image = itemDetails?.image || "";
    } catch (error) {
      console.error('Error fetching item details:', error);
    }
  };
  
  const fetchFavorites = async () => {
    try {
      const data = localStorage.getItem('data');
      const user = JSON.parse(data);
      const response = await fetch(`http://127.0.0.1:8000/api/favorites/user/${user.id}`);
      
      if (!response.ok) {
        throw new Error('Error fetching favorites');
      }
  
      const result = await response.json();
      console.log('Fetched favorites:', result);
      if (result.status === 'success') {
        favorites.value = result.data;
        for (const favorite of favorites.value) {
          await fetchFavoriteDetails(favorite);
        }
      } else {
        console.error('Failed to fetch favorites:', result.message);
      }
    } catch (error) {
      console.error('Error fetching favorites:', error);
    }
  };
  
  const goToItemDetails = (favorite: any) => {
    router.push({
      name: 'itemDetails',
      params: {
        category: favorite.category,
        itemId: favorite.itemId,
        itemName: favorite.item_name,
      },
    });
  };
  
  onMounted(() => {
    fetchFavorites();
  });
  </script>
  
  <style scoped>
    .item-list-page {
      width: 600px;
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
      max-width: 100%;
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

    @media screen and (max-width: 992px) {
      .item-list-page {
        width: 80%;
      }
      
    }
  
    </style>
  