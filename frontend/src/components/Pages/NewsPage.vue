<template>
  <div class="news-page">
    <h1>News</h1>
    <NewsAtom v-for="newsItem in news" key="newsItem.id" :newsItem="newsItem" />
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue';
import NewsAtom from '../Atoms/NewsAtom.vue';

const news = ref([]);

const fetchNews = async () => {
  try {
    const response = await fetch('/public/news/newsPaper.json');  // Ruta relativa al archivo news.json en public
    news.value = await response.json();
    console.log(news.value);
  } catch (error) {
    console.error('Failed to fetch news:', error);
  }
};

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
}
</style>
