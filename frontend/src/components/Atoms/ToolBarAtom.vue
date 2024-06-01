<template>
  <div class="toolbar">
    <div class="logo">
      <div class="menu-icon" @click="toggleMenu">&#9776;</div>
      <SearchBar /> <!-- SEARCH BAR COMPONENT -->
    </div>
    <div class="content" :class="{ 'hidden': hideToolbar }">
      <CategoryBar :showMenu="showMenu" @closeMenu="closeMenu" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import CategoryBar from './CategoryBar.vue';
import SearchBar from './SearchBar.vue';

const hideToolbar = ref(false);
const showMenu = ref(false);

const toggleMenu = () => {
  showMenu.value = !showMenu.value;
};

const closeMenu = () => {
  showMenu.value = false;
};

window.addEventListener('scroll', () => {
  hideToolbar.value = window.scrollY > 0;
});
</script>

<style scoped>
.toolbar {
  position: fixed;
  top: 1%;
  left: 1%;
  right: 0;
  height: 60px;
  color: #fff;
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 10px;
  transition: transform 0.3s ease-in-out;
}

.logo {
  display: flex;
  align-items: center;
}

.menu-icon {
  font-size: 32px;
  cursor: pointer;
}

.hidden {
  transform: translateY(-60px);
  transition: transform 0.3s ease-in-out;
}
</style>
