<!-- App.vue -->
<template>
  <RouterView/>
</template>

<script lang="ts" setup>
  import { RouterView } from 'vue-router';
</script>

<style scoped>

.app-header {
  /* Estilos para el encabezado de la aplicación */
  background-color: #333;
  /* Cambia el color de fondo según tus preferencias */
  color: #fff;
}

.app-header h1 {
  margin: 0;
  /* Elimina el margen predeterminado del título */
}

nav ul {
  list-style: none;
  /* Elimina los puntos de la lista del menú */
  padding: 0;
  /* Elimina el relleno predeterminado de la lista */
  margin: 0;
  /* Elimina el margen predeterminado de la lista */
}

nav ul li {
  display: inline-block;
  /* Coloca los elementos de la lista en línea */
  margin-right: 20px;
  /* Añade espacio entre los elementos de la lista */
}

nav ul li:last-child {
  margin-right: 0;
  /* Elimina el margen derecho del último elemento de la lista */
}

nav ul li a {
  color: #fff;
  /* Cambia el color de los enlaces según tus preferencias */
  text-decoration: none;
  /* Elimina el subrayado predeterminado de los enlaces */
}

nav ul li a:hover {
  text-decoration: underline;
  /* Añade un subrayado al pasar el ratón sobre los enlaces */
}




</style>
