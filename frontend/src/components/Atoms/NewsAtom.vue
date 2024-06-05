<template>
  <div :class="['news-atom', { 'main-news': isMainNews }]" @click="toggleContent">
    <img :src="newsItem.image" alt="News Image" class="news-image" />
    <h2>{{ newsItem.title }}</h2>
    <p v-if="showContent">{{ newsItem.content }}</p>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue';

const props = defineProps({
  newsItem: {
    type: Object,
    required: true
  },
  isMainNews: {
    type: Boolean,
    default: false
  }
});

const showContent = ref(false);

const toggleContent = () => {
  showContent.value = !showContent.value;
};
</script>

<style scoped>
.news-atom {
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 5px;
  margin-bottom: 20px;
  cursor: pointer;
}

.news-image {
  width: 100%;
  max-height: 300px;
  height: auto;
  object-fit: cover;
  margin-bottom: 10px;
}

.main-news {
  display: table;
  width: 100%;
  background-color: #f9f9f9;
  padding: 30px;
  border: 2px solid #aaa;
}
</style>
