<!-- CategoryListAtom.vue -->

<template>
  <div class="carousel"> <!-- MAIN CONTAINER -->
    <div class="arrow left" @click="prevCategory">&#10094;</div> <!-- LEFT ARROW -->
    <div class="categories-container"> <!-- CATEGORY CONTAINER -->
      <!-- CARROUSEL TRACK (Defines the movement of the items in the carousel) -->
      <div class="carousel-track" :style="{ transform: `translateX(-${currentIndex * (itemWidth + itemMargin)}px)` }">
        <!-- CARROUSEL ITEMS (Displays the items in the carousel) -->
        <div v-for="(category, index) in displayedCategories" :key="index" class="carousel-item">
          <!-- CARROUSEL ITEM (Displays the item in the carousel) -->
          <BoxAtom 
            :itemId="category.category"
            :itemName="category.name" 
            :imageUrl="category.imageUrl" 
            :className="props.className"
            :category="category.category" 
            @click="handleCategoryClick(category.category)"
          />
        </div>
      </div>
    </div>
    <div class="arrow right" @click="nextCategory">&#10095;</div> <!-- RIGHT ARROW -->
    <div class="dots"> <!-- INDICATORS -->
      <span 
        v-for="(category, index) in categories" 
        :key="index" 
        class="dot" 
        :class="{ active: (currentIndex % categories.length) === index }"
        @click="goToCategory(index)"
      ></span>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { ref, computed, defineEmits, defineProps, watch } from 'vue';
  import { useRouter } from 'vue-router';
  import BoxAtom from '../Atoms/BoxAtom.vue';

  const props = defineProps<{ className: string }>();

  const categories = [
    { name: "ITEMS", imageUrl: "/src/assets/categories/grace.png", category: "Items" },
    { name: "TALISMANS", imageUrl: "/src/assets/categories/talismans.png", category: "Talismans" },
    { name: "WEAPONS", imageUrl: "/src/assets/categories/weapons.png", category: "Weapons" },
    { name: "SHIELDS", imageUrl: "/src/assets/categories/shields.png", category: "Shields" },
    { name: "ARMORS", imageUrl: "/src/assets/categories/armors.png", category: "Armors" },
    { name: "ARROWS AND BOLTS", imageUrl: "/src/assets/categories/ammos.png", category: "Ammos" },
    { name: "INCANTATIONS", imageUrl: "/src/assets/categories/incantations.png", category: "Incantations" },
    { name: "SORCERIES", imageUrl: "/src/assets/categories/sorceries.png", category: "Sorceries" },
    { name: "SPIRITS", imageUrl: "/src/assets/categories/spirits.png", category: "Spirits" },
    { name: "ASHES OF WAR", imageUrl: "/src/assets/categories/ashes.png", category: "Ashes" },
    { name: "CREATURES", imageUrl: "/src/assets/categories/creatures.png", category: "Creatures" },
    { name: "CHARACTERS", imageUrl: "/src/assets/categories/characters.png", category: "Npcs" },
    { name: "BOSSES", imageUrl: "/src/assets/categories/bosses.png", category: "Bosses" },
  ];

  const router = useRouter();
  const emits = defineEmits(['click']);
  const currentIndex = ref(categories.length); // Actual index
  const itemWidth = 280; // Width of each item
  const itemMargin = 10; // Margin between each item

  const handleCategoryClick = (category: string) => { /* Handle click on each category */
    emits("click", category);
    router.push({ name: 'categories', params: { category: category } });
  };

  const displayedCategories = computed(() => { /* Calculates the displayed categories */
    const displayed = []; /* Array to store the displayed categories */
    for (let i = 0; i < categories.length; i++) { /* Loops through each category */
      const index = (currentIndex.value + i) % categories.length; /* Calculates the index */
      if (displayed.length < categories.length) { /* Checks if the array is not full */
        displayed.push(categories[index]); /* Adds the category to the array */
      }
      displayed.push(...categories); /* Adds all the categories to the array */
    }
    return displayed; 
  });

  const prevCategory = () => { /* Goes to the previous category */
    currentIndex.value -= 1;
    if (currentIndex.value < 0) {
      currentIndex.value = displayedCategories.value.length - 1;
    }
  };

  const nextCategory = () => { /* Goes to the next category */
    currentIndex.value += 1;
    if (currentIndex.value >= displayedCategories.value.length) {
      currentIndex.value = 0;
    }
  };

  const goToCategory = (index: number) => { /* Goes to a specific category */
    currentIndex.value = index + categories.length;
    if (currentIndex.value >= displayedCategories.value.length) {
      currentIndex.value = 0;
    }
  };

  watch(currentIndex, (newIndex) => { /* Watch for changes in the current index */
    if (newIndex >= displayedCategories.value.length) {
      currentIndex.value = newIndex % categories.length;
    } else if (newIndex < 0) {
      currentIndex.value = displayedCategories.value.length + (newIndex % categories.length);
    }
  });
</script>

<style scoped>
  .carousel {
    display: flex; /* Display as flex */
    flex-direction: column; /* Column orientation */
    align-items: center; 
    position: relative; 
    width: 90%; 
    overflow: hidden; /* Hides the overflowing content */
  }

  .arrow {
    position: absolute; /* Absolute position relative to the carousel */
    top: 50%; /* Position from the top */
    z-index: 1; /* Position in front of the carousel */
    transform: translateY(-50%); /* Center the arrow */
    font-size: 2rem; 
    cursor: pointer; 
    transition: color 0.3s ease; /* Transition for color change */
  }

  .left {
    left: 5px; /* Positions the left arrow */
  }

  .right {
    right: 5px; /* Positions the right arrow */
  }

  .arrow:hover {
    color: #cabba2; /* Change color on hover */
  }

  .categories-container {
    overflow: hidden; /* Hides the overflowing content */
    width: 80%; /* Width of the container */
  }

  .carousel-track {
    display: flex; /* Flexbox for organizing the items */
    transition: transform 0.5s ease-in-out; /* Transition for smooth scrolling */
  }

  .carousel-item {
    flex: 0 0 auto; /* Flexbox for each item */
    width: 280px; /* Width of each item */
    margin-right: 10.5px; /* Margin between each item */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Transitions for hover effects */
  }

  .carousel-item:hover {
    transform: scale(1.05); /* Scale up on hover */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
  }

  .dots {
    display: flex; /* Flexbox to organize the dots */
    justify-content: center; /* Center the dots */
    margin-top: 20px; /* Margin at the top */
  }

  .dot {
    width: 10px; /* Width of the dots */
    height: 10px; /* Height of the dots */
    border-radius: 50%; /* Rounded dots */
    background-color: #333; /* Color of the active dot */
    margin: 0 5px; /* Margin between the dots */
    cursor: pointer; /* Cursor for the dots */
    transition: background-color 0.3s ease; /* Transition for background color */
  }

  .dot.active {
    background-color: #cabba2; /* Change color on hover */
  }

  .dot:hover {
    background-color: #cabba2; /* Change color on hover */
  }

  /* RESPONSIVENESS */

  @media screen and (max-width: 1024px) {
    .carousel {
      width: 70%; 
    }
  }

  @media screen and (max-width: 768px) {
    .carousel {
      width: 60%; 
      height: 100%;
      overflow: hidden; /* Hides the overflowing content */
      display: relative; /* Display as table */
      table-layout: fixed; /* Fixed table layout */
      align-items: center; /* Center the carousel */
      justify-content: center; /* Center the carousel */
    }
    
    .categories-container {
      display: flex; 
      flex-direction: column; 
      align-items: center;  
      justify-content: center;
      width: 100%; 
      margin: 2%;
    }

    .carousel-track {
      justify-content: center; /* Center the items */
    }

    .carousel-item {
      display: grid;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .dots {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-top: 20px;
    }

    .carousel-item:hover {
      transform: scale(1.03); /* Scale up on hover */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
    }
  }
 
</style>
