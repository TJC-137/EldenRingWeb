<template>
  <div class="search-bar-wrapper">
    <button class="search-icon" @click="toggleSearch">
      <img src="/src/assets/Icons/search.png" alt="Search Icon" />
    </button>
    <div v-if="showSearch" class="search-bar-container">
      <input
        v-model="searchQuery"
        @keyup.enter="searchItems"
        placeholder="Search items..."
        class="search-bar"
      />
    </div>
    <div v-if="error" class="error-message">
      {{ error }}
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useSearchApi } from '../../api/composables/searchApi';

const searchQuery = ref('');
const showSearch = ref(false);
const router = useRouter();
const error = ref('');
const { searchResults, searchInAllCategories } = useSearchApi();

const toggleSearch = () => {
  showSearch.value = !showSearch.value;
};

const searchItems = async () => {
  if (searchQuery.value) {
    await searchInAllCategories(searchQuery.value);
    if (!error.value) {
      if (searchResults.value.length === 1) {
        const item = searchResults.value[0];
        router.push({
          name: 'itemDetails',
          params: {
            category: item.category,
            itemId: item.id,
            itemName: item.name,
          },
        });
      } else {
        router.push({
          name: 'itemList',
          query: { search: searchQuery.value },
        });
      }
    }
  }
};
</script>

<style scoped>
.search-bar-wrapper {
  display: flex;
  align-items: center;
  position: relative;
  padding: 0 15px;
  margin-top: 10%;
  z-index: 1000;
}

.search-icon {
  background: none;
  border: none;
  cursor: pointer;
  padding: 0;
}

.search-icon img {
  width: 32px;
  height: 32px;
}

.search-bar-container {
  position: absolute;
  top: 0px;
  left: 50px;
  border-radius: 5px;
  padding: 5px;
  width: 150%;
  z-index: 10;
}

.search-bar {
  width: 100%;
  padding: 5px;
  border-radius: 4px;
  border: 1px solid #e1c680;
}

.search-bar::placeholder {
  color: #828282;
}

.search-bar:focus {
  outline: none;
}

.search-bar:focus::placeholder {
  color: transparent;
}

@media screen and (max-width: 768px) {
  .search-bar-container {
    position: fixed;
    width: 80%;
    border-radius: 0;
    padding: 5px;
    top: 5rem;
    left: 3rem;
  }

  .search-bar-wrapper {
    left: -2.7rem;
    top: 3.5rem;
  }
}
</style>
