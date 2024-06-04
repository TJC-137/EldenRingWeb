<!-- HomePage.vue -->
<template>
  <div class="land-page">
    <div class="carousel">
      <div class="carousel-track" :style="{ transform: `translateX(-${currentIndex * 100}%)` }">
        <div v-for="(section, index) in sections" :key="index" class="carousel-item">
          <div class="section" @click="selectSection(section)">
            <img :src="section.imageUrl" :alt="section.name" />
            <h2>{{ section.name }}</h2>
          </div>
        </div>
      </div>
      <div class="dots">
        <span v-for="(section, index) in sections"
          class="dot"
          :key="index"
          :class="{ active: currentIndex === index }"
          @click="goToSection(index)"
        ></span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';

// Import images
const newsImage = new URL('../../assets/images/Shattering.webp', import.meta.url).href;
const categoriesImage = new URL('../../assets/images/ShadowOfTheErdtree.webp', import.meta.url).href;
const mapImage = new URL('../../assets/images/exploration.webp', import.meta.url).href;

const router = useRouter();


const sections = ref([
  { name: "News", imageUrl: newsImage, path: '/news' },
  { name: "Categories", imageUrl: categoriesImage, path: '/categories' },
  { name: "Map", imageUrl: mapImage, path: '/map' }
]);

const currentIndex = ref(0);

const selectSection = (section: { path: string }) => {
  router.push(section.path);
};

const goToSection = (index: number) => {
  currentIndex.value = index;
};
</script>

<style scoped>
.land-page {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}

.carousel {
  width: 80%;
  overflow: hidden;
  margin-left: 1.5rem;
  margin-right: 0.5rem;
}

.carousel-track {
  display: flex;
  transition: transform 0.5s ease-in-out;
}

.carousel-item {
  flex: 0 0 auto;
  width: 100%;
  text-align: center;
  transition: all 0.5s;
}

.section {
  cursor: pointer;
}

.section img {
  width: 100%;
  height: auto;
  border-radius: 10px;
  margin-bottom: 10px;
  max-height: 450px;
  object-fit: cover;
}

.section h2 {
  font-size: 24px;
  color: #fff;
}

.dots {
  display: flex;
  justify-content: center;
  margin-top: 20px;
  margin-right: 1rem;
}

.dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: #333;
  margin: 0 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.dot.active {
  background-color: #cabba2;
}

.dot:hover {
  background-color: #cabba2;
}

.carousel-item:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.carousel-item img {
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

.carousel-item h2 {
  font-size: 24px;
  color: #fff;
}

.carousel-item p {
  font-size: 16px;
  color: #fff;
}

.carousel-item button {
  margin-top: 10px;
}

.carousel-item button:hover {
  background-color: #cabba2;
}

.carousel-item button:active {
  background-color: #cabba2;
}

.carousel-item button:focus {
  outline: none;
}

@media screen and (max-width: 768px) {
  .land-page {
    max-width: 90%;
  }

  .carousel {
    width: 100%;
    margin-left: 3rem;
  }

  .dots {
    margin-left: 1rem;
  }

}

</style>
