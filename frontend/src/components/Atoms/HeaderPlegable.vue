<template>
  <ul class="toolbar" :class="{ 'hidden': hideToolbar }">
    <li class="logo">
      <img src="/src/media/images/EldenRingTitle.png" class="title" />
    </li>

    <li class="content">
      <slot>
        <CategoryBar />
      </slot>
    </li>
  </ul>
</template>

<script setup>
import { ref } from 'vue';
import CategoryBar from './CategoryBar.vue';

const hideToolbar = ref(false);

// Detectar el scroll para mostrar/ocultar la barra de herramientas
window.addEventListener('scroll', () => {
  hideToolbar.value = window.scrollY > 0;
});
</script>

<style scoped>
.toolbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 60px;
  /* Altura fija para la barra */
  background-color: #1c1c1c;
  color: #fff;
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: space-between;
  list-style: none;
  padding: 0;
  margin: 0;
  transition: transform 0.3s ease-in-out;
}

.logo {
  display: flex;
  align-items: center;
}

.logo .title {
  width: 10rem;
}

.content {
  display: flex;
  align-items: center;
  justify-content: center;
}

.hidden .logo {
  opacity: 0.5;
  /* Reducir la opacidad de la imagen cuando la barra se pliega */
}

.hidden {
  transform: translateY(-60px);
  /* Ocultar hacia arriba */
}
</style>