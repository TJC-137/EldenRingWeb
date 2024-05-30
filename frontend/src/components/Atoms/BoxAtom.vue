<!-- BoxAtom.vue -->

<template>
    <div :class="props.className" :key="props.itemId" @click="handleItemClick">
      <h3>{{ itemName }}</h3>
      <div class="image">
        <img :src="imageUrl" :alt="itemName" />
      </div>
    </div>
</template>
  
<script setup lang="ts">
    import { defineProps, defineEmits } from 'vue';

    const props = defineProps<{
    itemId: string;
    itemName: string;
    imageUrl: string;
    className: string;
    }>();

    const emits = defineEmits(['itemClick']);

    
    const handleItemClick = () => {
        emits('itemClick', { itemId: props.itemId, itemName: props.itemName });
    };
    
    
</script>

<style scoped>

    /* title */
    h3 {
        color: rgba(255, 255, 255, 0.703);
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        margin-bottom: 5%;
        text-align: center;
    }

    .image {
        text-align: center;
        display: inline-block;
    }

    /* Box */
    .box {
        display: table;
        cursor: pointer;
        text-align: center;
        display: inline-block; /* Ajusta tamaño según el contenido */
        box-sizing: border-box; /* Incluye el borde y el relleno en el ancho total */
   
        border: 2px solid #ab966f;
        border-radius: 1%;   
        padding: 10px;

        width: 250px; /* Tamaño fijo para la caja */
        min-width: 260px; /* Tamaño mínimo para la caja */
        max-width: 260px; /* Tamaño máximo para la caja */

        height: 320px; /* Tamaño fijo para la caja */
        min-height: 360px; /* Tamaño mínimo para la caja */
        max-height: 360px; /* Tamaño máximo para la caja */

    }


    .box img {
        width: 220px;
        height: 240px;
        object-fit: cover;
        border-radius: 2%;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
    }

    /* category */
    .category {
        border: 2px solid #ab966f;
        border-radius: 1%;
        display: table;
        text-align: center;
        justify-content: center;
        cursor: pointer;
        font-size: small;
        margin: 2%;

        width: 160px; /* Tamaño fijo para la categoría */
        min-width: 160px; /* Tamaño mínimo para la categoría */
        max-width: 160px; /* Tamaño máximo para la categoría */
        
        height: 220px; /* Tamaño fijo para la categoría */
        min-height: 220px; /* Tamaño mínimo para la categoría */
        max-height: 220px; /* Tamaño máximo para la categoría */
    }

    .category img{
        
        width: 150px;
        height: 200px;
    }



</style>