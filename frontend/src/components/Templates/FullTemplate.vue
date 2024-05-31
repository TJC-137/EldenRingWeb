<template>

  <div class="background">  <!-- WALLPAPER -->

    <div> <!-- SEARCH BAR -->
        <input v-model="searchQuery" 
        @keyup.enter="searchItems" 
        placeholder="Search items..." 
        class="search-bar"/>
    </div>

    <div class="overlay">   <!-- OPACITY LAYER --> </div>

    <div class="panel">     <!-- OPACITY PANEL -->

      <ToolBarAtom />

                            <!-- HEADER -->
      <div class="header">  <HeaderTitle /> </div>
            
                               <!-- CONTENT -->
      <section id="content">     <RouterView />  </section>

    </div>

  </div>

</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { RouterView } from 'vue-router';
import HeaderTitle from '../Atoms/HeaderTitle.vue';
import ToolBarAtom from '../Atoms/ToolBarAtom.vue';

const searchQuery = ref('');
const router = useRouter();

const searchItems = () => {
  if (searchQuery.value) {
    router.push({
      name: 'itemList',
      params: { category: 'items', itemName: searchQuery.value }
    });
  }
};
</script>

<style scoped>
.background {
  /* Establece la imagen como fondo */
  background-image: url("/src/assets/images/wallpaperRing.webp");
  /* Ajusta la imagen para que cubra todo el área */
  background-size: cover;
  /* Centra la imagen */
  background-position: center;
  /* Fija la imagen */
  background-attachment: fixed;
  background-repeat: no-repeat;
  /* Asegura que la imagen cubra toda la altura de la ventana */
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

.overlay { /* Negro con opacidad */
  background-color: rgba(0, 0, 0); /* Reducido la opacidad para que no sea completamente oscuro */
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  animation: fadeOut 5s forwards;
}

.panel {
  max-width: 60%; /* Ancho fijo del contenido */
  max-height: 780px; /* Altura fija del contenido */
  background-color: rgba(12, 12, 12, 0.8); /* Color de fondo del contenido */
  border-radius: 10px;
  padding: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); 
  border-left: 1px solid #cabba2;
  border-right: 1px solid #cabba2;
  overflow-y: auto; /* Habilita el desplazamiento vertical cuando sea necesario */
  z-index: 1;
  animation: fadeIn 5s forwards;
}

.header {
  text-align: center; /* Alinea el texto al centro */
  margin-bottom: 20px; /* Espacio entre el encabezado y el contenido principal */
  display: flex;
  flex-direction: column;
  align-items: center;
}

.search-bar {
  display: flex;
  position: absolute;
  top: 3%;
  right: 3%;
  padding: 5px;
  border-radius: 5px;
  border: 1px solid #e1c680;
  color: #e1c680;
  width: 50%;
  max-width: 300px;
  animation: fadeIn 5s forwards;
}

#content {
  height: 100%;

}

@keyframes fadeOut {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

/* RESPONSIVE */

@media screen and (max-width: 1440px) {
  .panel {
    max-width: 100%;
    width: 65%;
  }

  .search-bar {
    display: table; 
  }
}

@media screen and (max-width: 1024px) {
  .panel {
    max-width: 100%;
    width: 80%;
  }
  .search-bar {
    display: flex;
  }
}
</style>
