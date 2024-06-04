<template>
  <div class="header" :class="{ 'show': showHeader }">
    <img src="/src/assets/images/EldenRingTitle.png" class="title" />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';

const showHeader = ref(false);

onMounted(() => {
  // Animación para mostrar el encabezado
  setTimeout(() => {
    showHeader.value = true;
  }, 2000);
});
</script>

<style scoped>
.header {
  position: fixed;
  top: 20px;
  /* Ajusta la posición vertical según tus preferencias */
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  opacity: 0;
  z-index: 100;
  transition: opacity 3s ease-in-out; 
}

.header.show {
  opacity: 1;
}

.title {
  text-shadow: 3px 3px 3px #3a3a3a;
  top: 1%;
  width: 20rem;
  cursor: pointer;
  z-index: 100;
  transition: transform 0.5s ease-in-out;
}

.title:hover {
  transform: scale(1.1);
}

@media screen and (max-width: 768px) {
  .title {
    width: 15rem;
  }
  
}
</style>
