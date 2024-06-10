<template>
    <div class="lore-container">
      <h1>Lore</h1>
        <div class="content-wrapper">
            <div class="lore" @mouseover="changeText" @mouseout="resetText"></div>
            <p class="lore-text">{{ loreText }}</p>
        </div>
        <div class="gen-tree-wrapper">
            <h2> Genealogycal Tree </h2>
            <img class="gen-tree" src="../../assets/images/demigod_gentree.webp">
            <p class="lore-description">Discover the intricate and fascinating lore of the Elden Ring universe. Explore the demigod genealogy and uncover the secrets hidden within.</p>      
        </div>
      </div>
  </template>
  
  <script setup lang="ts">
  import { ref } from 'vue';
  
  const loreText = ref('Unveil the dramatic events of the Shattering and the rise and fall of the demigods.');
  
  const changeText = () => {
    loreText.value = 'Explore the night of the plot, and discover the secrets of the demigods.';
  };
  
  const resetText = () => {
    loreText.value = 'Unveil the dramatic events of the Shattering and the rise and fall of the demigods.';
  };
  </script>
  
  <style scoped>
  .lore-container {
    text-align: center;
    margin: 20px;
  }
  
  .content-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 20px; /* Espacio entre la imagen y el texto */
  }
  
  .lore {
    width: 100%;
    max-width: 300px;
    height: 300px; /* Ajusta la altura según sea necesario */
    background-image: url('../../assets/images/radagon.webp');
    background-size: cover;
    background-position: center;
    cursor: pointer;
    transition: background-image 0.5s ease-in-out;
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
  
  .lore:hover {
    background-image: url('../../assets/images/marikaShattering.webp');
  }


  .gen-tree-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-top: 20px;
  }
  
  .gen-tree {
    width: 100%;
    max-width: 800px;
    margin-top: 20px;
    display: block;
    margin-left: auto;
    margin-right: auto;
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
  
  .lore-text {
    font-size: 16px;
    margin-top: 20px;
    color: #e1c680;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
    max-width: 300px;
  }

  .lore-description {
    font-size: 16px;
    margin-top: 20px;
    color: #e1c680;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
  }

  @media screen and (max-width: 768px) {
    .content-wrapper {
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 20px;
    }
    
  }

  </style>
  