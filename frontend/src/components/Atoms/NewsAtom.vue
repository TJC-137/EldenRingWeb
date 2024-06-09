<template>
  <div :class="['news-atom', { 'main-news': isMainNews }]" @click="toggleContent">
    <img :src="newsItem.image" alt="News Image" class="news-image" />
    <h2>{{ newsItem.title }}</h2>
    <div v-if="showContent">
      <p v-html="formattedContent"></p>
      <div v-if="newsItem.video">
        <iframe :src="newsItem.video" width="530" height="280" 
        title="YouTube video player" frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
        </iframe>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, computed } from 'vue';

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

const formattedContent = computed(() => {
  return props.newsItem.content.replace(/\n/g, '<br>');
});
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

img {
  width: 100%;
  height: auto;
  
  -webkit-mask-image: linear-gradient(
    to bottom,
    rgba(0, 0, 0, 0) 5%,  /* Top */
    rgba(0, 0, 0, 1) 20%, /* Fade in */
    rgba(0, 0, 0, 1) 80%, /* Fade out */
    rgba(0, 0, 0, 0) 99% /* Bottom */
  ),
  linear-gradient(
    to right,
    rgba(0, 0, 0, 0) 3%,  /* Left */
    rgba(0, 0, 0, 1) 20%, /* Fade in */
    rgba(0, 0, 0, 1) 85%, /* Fade out */
    rgba(0, 0, 0, 0) 97% /* Right */
  );
  -webkit-mask-composite: source-in;
          mask-composite: intersect;

}
</style>
