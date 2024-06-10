<template>
    <div class="classes-page">
      <h1>Origins</h1>
      <div class="carousel-container">
        <div class="carousel">
          <button class="nav-button prev" @click="prevClass">❮</button>
          <div class="carousel-track" :style="{ transform: `translateX(-${currentIndex * 100}%)` }">
            <div v-for="(classItem, index) in classes" :key="classItem.id" class="carousel-item">
              <div class="section">
                <img :src="classItem.image" alt="Class Image" />
                <h2>{{ classItem.name }}</h2>
                <p>{{ classItem.description }}</p>
                <button class="toggle-button" @click="toggleStats(index)">
                  {{ showStats[index] ? 'Hide Stats' : 'Show Stats' }}
                </button>
                <div class="stats" v-if="showStats[index]">
                  <p class="level">Level: {{ classItem.stats.level }}</p>
                  <p class="vigor">Vigor: {{ classItem.stats.vigor }}</p>
                  <p class="mind">Mind: {{ classItem.stats.mind }}</p>
                  <p class="endurance">Endurance: {{ classItem.stats.endurance }}</p>
                  <p class="strength">Strength: {{ classItem.stats.strength }}</p>
                  <p class="dexterity">Dexterity: {{ classItem.stats.dexterity }}</p>
                  <p class="intelligence">Intelligence: {{ classItem.stats.intelligence }}</p>
                  <p class="faith">Faith: {{ classItem.stats.faith }}</p>
                  <p class="arcane">Arcane: {{ classItem.stats.arcane }}</p>
                </div>
              </div>
            </div>
          </div>
          <button class="nav-button next" @click="nextClass">❯</button>
        </div>
        <div class="dots">
          <span v-for="(classItem, index) in classes"
                class="dot"
                :key="index"
                :class="{ active: currentIndex === index }"
                @click="goToClass(index)"></span>
        </div>
      </div>
    </div>
  </template>
  
  
  <script setup lang="ts">
  import { ref, onMounted, watch } from 'vue';
  import { fetchClasses, Class } from '../../api/models/classesApi';
  
  const classes = ref<Class[]>([]);
  const currentIndex = ref(0);
  const showStats = ref<boolean[]>([]);
  
  const fetchClassesData = async () => {
    try {
      classes.value = await fetchClasses();
      showStats.value = new Array(classes.value.length).fill(false);
    } catch (error) {
      console.error('Failed to fetch classes:', error);
    }
  };
  
  const prevClass = () => {
    currentIndex.value = (currentIndex.value - 1 + classes.value.length) % classes.value.length;
    resetStats();
  };
  
  const nextClass = () => {
    currentIndex.value = (currentIndex.value + 1) % classes.value.length;
    resetStats();
  };
  
  const goToClass = (index: number) => {
    currentIndex.value = index;
    resetStats();
  };
  
  const toggleStats = (index: number) => {
    showStats.value[index] = !showStats.value[index];
  };
  
  const resetStats = () => {
    showStats.value = new Array(classes.value.length).fill(false);
  };
  
  onMounted(() => {
    fetchClassesData();
  });
  
  watch(currentIndex, resetStats);
  </script>
  
  
  <style scoped>
  .classes-page {
    padding: 10px;
    max-width: 70%;
    width: 800px;
    margin: auto;
  }
  
  .classes-page h1 {
    text-align: center;
    margin-bottom: 20px;
  }
  
  .carousel-container {
    position: relative;
    width: 100%;
    overflow: hidden;
    background-color: rgba(0, 0, 0, 0.8);
    padding: 20px;
    border-radius: 10px;
  }
  
  .carousel {
    display: flex;
    align-items: center;
    position: relative;
  }
  
  .carousel-track {
    display: flex;
    transition: transform 0.5s ease-in-out;
    width: 100%;
  }
  
  .carousel-item {
    flex: 0 0 100%;
    display: flex;
    justify-content: center;
    transition: all 0.5s;
  }
  
  .section {
    cursor: pointer;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.8);
    padding: 20px;
    border-radius: 10px;
    margin: 0 10px;
    border: 1px solid #e2c790;
    max-width: 300px;
    width: 100%;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  }
  
  .section img {
    max-width: 150px;
    margin-bottom: 10px;
  }
  
  .section h2 {
    font-size: 24px;
    color: #fff;
  }
  
  .section p {
    font-size: 16px;
    color: #fff;
  }
  
  .toggle-button {
    margin-top: 10px;
    background-color: #222222af;
    color: #fff;
    padding: 5px 10px;
    cursor: pointer;
    border: 1px solid #e2c790;
    border-radius: 5px;
    font-size: 14px;
    transition: background-color 0.3s ease;

  }
  
  .toggle-button:hover {
    background-color: #e2c790;
    color: #333;
  }
  
  .stats {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    color: #fff;
    gap: 4px;
  }

  

  
  .nav-button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    border: none;
    color: #fff;
    font-size: 24px;
    cursor: pointer;
    padding: 10px;
    border-radius: 50%;
    z-index: 100;
  }
  
  .nav-button.prev {
    left: 10px;
  }
  
  .nav-button.next {
    right: 10px;
  }

  .nav-button:hover {
    border-radius: 0px;
    color: rgba(210, 171, 113, 0.8);
  }
  


  .dots {
    display: flex;
    justify-content: center;
    margin-top: 20px;
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
  
  .section p.level::before,
  .section p.intelligence::before,
  .section p.dexterity::before,
  .section p.strength::before,
  .section p.faith::before,
  .section p.arcane::before,
  .section p.mind::before,
  .section p.endurance::before,
  .section p.vigor::before {
    content: '';
    display: inline-block;
    width: 25px;
    height: 25px;
    background-size: contain;
    background-repeat: no-repeat;
    margin-right: 5px;
    vertical-align: middle;
  }
  
  .section p.level::before {
    background-image: url('../../assets/Icons/runes.png');
  }
  
  .section p.vigor::before {
    background-image: url('../../assets/Icons/poise.png');
  }
  
  .section p.mind::before {
    background-image: url('../../assets/Icons/sleep.png');
  }
  
  .section p.endurance::before {
    background-image: url('../../assets/Icons/vitality.png');
  }
  
  .section p.strength::before {
    background-image: url('../../assets/Icons/strength.png');
  }
  
  .section p.dexterity::before {
    background-image: url('../../assets/Icons/dexterity.png');
  }
  
  .section p.intelligence::before {
    background-image: url('../../assets/Icons/intelligence.png');
  }
  
  .section p.faith::before {
    background-image: url('../../assets/Icons/faith.png');
  }
  
  .section p.arcane::before {
    background-image: url('../../assets/Icons/arcane.png');
  }
  
  
  @media screen and (max-width: 768px) {
    .section {
      max-width: 100%;
      width: 70%;
    }

    .section img {
      max-width: 100px;
    }

    .carousel {
      width: 100%;
    }

    .carousel-container {
      width: 100%;
    }

    .carousel-item {

      width: 100%;
    }

    .carousel-track {
      width: 100%;
    }
    
  }

  </style>
  