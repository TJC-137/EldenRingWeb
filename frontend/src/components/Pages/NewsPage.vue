<template>
  <div class="news-page">
    <h1>News</h1>
    <NewsAtom v-for="newsItem in paginatedNews" :key="newsItem.id" :newsItem="newsItem" />
    <PaginatorAtom
      :totalItems="news.length"
      :itemsPerPage="itemsPerPage"
      v-model:modelValue="currentPage"
      @update:itemsPerPage="itemsPerPage = $event"
    />
  </div>
</template>

<script lang="ts" setup>
import { ref, computed, onMounted } from 'vue';
import NewsAtom from '../Atoms/NewsAtom.vue';
import PaginatorAtom from '../Atoms/PaginatorAtom.vue';

const news = ref([]);
const currentPage = ref(1);
const itemsPerPage = ref(1);

const fetchNews = async () => {
  try {
    const response = await fetch('news/newsPaper.json'); // Ruta relativa al archivo news.json en public
    news.value = await response.json();
    news.value.sort((a, b) => b.id - a.id); // Ordenar por id descendente
    console.log(news.value);
  } catch (error) {
    console.error('Failed to fetch news:', error);
  }
};

const paginatedNews = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value;
  const end = start + itemsPerPage.value;
  return news.value.slice(start, end);
});

onMounted(() => {
  fetchNews();
});
</script>

<style scoped>
.news-page {
  padding: 10px;
  max-width: 70%;
  width: 800px;
  margin: auto;
}

.news-page h1 {
  text-align: center;
  margin-bottom: 20px;
  color: #e1c680; /* Cambia el color del texto del encabezado */
}
</style>
