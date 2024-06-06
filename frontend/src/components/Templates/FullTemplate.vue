<template>
  <div class="background">  <!-- WALLPAPER -->
    <div class="top-header">
      <ToolBarAtom />         <!-- TOOLBAR -->
    </div>
    <div class="header">
      <HeaderTitle @click="goToHomePage" /> <!-- HEADER -->       
    </div>
    <div class="overlay">   <!-- OPACITY LAYER --> </div>
    <div class="panel">     <!-- OPACITY PANEL -->
      <section id="content"><RouterView /></section>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';
import { RouterView } from 'vue-router';
import HeaderTitle from '../Atoms/HeaderTitle.vue';
import ToolBarAtom from '../Atoms/ToolBarAtom.vue';

const router = useRouter();

const goToHomePage = () => {
  router.push({ name: 'home' });
};
</script>

<style scoped>
.background {
  background-image: url("/src/assets/images/wallpaperRing.webp");
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  background-repeat: no-repeat;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

.overlay { 
  background-color: rgba(0, 0, 0, 0.7); 
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  animation: fadeOut 5s forwards;
}

.panel {
  position: absolute;
  max-width: 60%;
  max-height: 780px;
  background-color: rgba(12, 12, 12, 0.8); 
  border-radius: 10px;
  padding: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); 
  border-left: 1px solid #cabba2;
  border-right: 1px solid #cabba2;
  overflow-y: auto;
  z-index: 1;
  animation: fadeIn 5s forwards;
}

.header {
  text-align: center;
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.top-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}


#content {
  height: 100%;
  justify-content: center;
  align-items: center;
}

@keyframes fadeOut {
  0% { opacity: 1; }
  100% { opacity: 0; }
}

@keyframes fadeIn {
  0% { opacity: 0; }
  50% { opacity: 0; }
  100% { opacity: 1; }
}

@media screen and (max-width: 1440px) {
  .panel {
    max-width: 70%;
  }

}

@media screen and (max-width: 1280px) {
  .panel {
    max-width: 70%;
  }
  
}


@media screen and (max-width: 1024px) {
  .panel {
    width: 80%;
  }
}

@media screen and (max-width: 768px) {
  .top-header {
    flex-direction: column;
  }
  .header {
    align-items: center;
  }
  .search-bar-container {
    margin-top: 10px;
  }
  .panel {
    max-width: 90%;
    width: 90%;
    max-height: 83%;
    overflow-y: auto;
  }

  #content {
    height: 100%;
    justify-content: center;
    align-items: center;
  }

}
</style>
