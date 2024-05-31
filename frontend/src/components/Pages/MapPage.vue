<template>
    <div class="map-page"  tabindex="0">
        <div >
            <iframe src="https://mapgenie.io/elden-ring/maps/the-lands-between?embed=light" class="map"></iframe></div>
        <div v-html="mapContent"></div>
    </div>
</template>

<script setup lang="ts">
</script>

<style scoped>
.map {
    position: absolute;
    display: grid;
    grid-template-columns: repeat(6, 256px); /* 5 columnas de 256px cada una */
    grid-template-rows: repeat(6, 256px); /* 5 filas de 256px cada una */
    gap: 0; /* Sin espacio entre las celdas */
    position: relative; width: 100%;
    height: 65vh;
    width: 50vw;
    justify-content: center;
    align-items: center;
    background-color: #000;
    justify-content: center;
    align-items: center;

}

/* Estilo adicional para mejorar la presentación */
.map-page {
    background-color: #000; /* Fondo oscuro para contrastar con las imágenes del mapa */
    gap: 10px;
}

</style>