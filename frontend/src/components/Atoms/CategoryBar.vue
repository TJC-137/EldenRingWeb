<template>
    <div class="category-bar" :class="{ 'show': showMenu }">
        <div class="header-logo">
            <div class="menu-icon" @click="toggleMenu">
                <img src="../../assets/images/ERicon.png" alt="Elden Ring Logo" class="logo" />
            </div>
            <div class="close-btn" @click="closeMenu">×</div>
        </div>

        <div class="buttons">
            <CustomButton className="custom-button" text="Register" @click="register" />
            <img src="../../assets/images/ERicon.png" alt="Elden Ring Logo" class="logo" />
            <CustomButton className="custom-button" text="Login" @click="login" />
        </div>

      <ul class="category-list">
        <li v-for="category in categories" :key="category.name" @click="handleCategoryClick(category.category)">
          <div class="item">
            <p>{{ category.name }}</p>
            <img :src="category.imageUrl" />
          </div>
        </li>
      </ul>
    </div>
  </template>
  
  <script setup lang="ts">
  import { defineProps, defineEmits } from 'vue';
  import { useRouter } from 'vue-router';
  import CustomButton from './ButtonAtom.vue';
  
  const props = defineProps<{
    showMenu: boolean;
  }>();
  const emits = defineEmits(['closeMenu']);
  
  const categories = [
    { name: "ITEMS", imageUrl: "src/assets/Icons/keys.png", category: "Items" },
    { name: "TALISMANS", imageUrl: "/src/media/categories/talismans.png", category: "Talismans" },
    { name: "WEAPONS", imageUrl: "/src/media/categories/weapons.png", category: "Weapons" },
    { name: "ARMORS", imageUrl: "/src/media/categories/armors.png", category: "Armors" },
    { name: "ARROWS AND BOLTS", imageUrl: "/src/media/categories/ammos.png", category: "Ammos" },
    { name: "INCANTATIONS", imageUrl: "/src/media/categories/incantations.png", category: "Incantations" },
    { name: "SORCERIES", imageUrl: "/src/media/categories/sorceries.png", category: "Sorceries" },
    { name: "SPIRITS", imageUrl: "/src/media/categories/spirits.png", category: "Spirits" },
    { name: "CHARACTERS", imageUrl: "/src/media/categories/characters.png", category: "Characters" },
    { name: "BOSSES", imageUrl: "/src/media/categories/bosses.png", category: "Bosses" },
  ];
  
  const router = useRouter();
  
  const handleCategoryClick = (category: string) => {
    router.push({ name: 'categories', params: { category: category } });
    emits('closeMenu');
  };
  
  const closeMenu = () => {
    emits('closeMenu');
  };
  
  const login = () => {
    console.log("Login clicked");
    router.push({ path: '/login' });
  };
  
  const register = () => {
    console.log("Register clicked");
    router.push({ name: 'register' });
  };
  </script>
  
  <style scoped>
  .category-bar {
    position: fixed;
    top: 0;
    left: -340px;
    width: 300px;
    height: 100%;
    background-color: #1c1c1c;
    color: #fff;
    overflow-y: auto;
    transition: left 0.3s ease-in-out;
    z-index: 1000;
    padding: 20px;
  }
  
  .category-bar.show {
    left: 0;
  }
  
  .close-btn {
    font-size: 30px;
    cursor: pointer;
    text-align: right;
  }
  
  .category-list {
    list-style: none;
    padding: 0;
  }

  .header-logo {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
  }

  .logo{
    width: 50px;
  }

  .buttons {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
  }
  
  .category-list .item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    border-bottom: 1px solid #444;
    cursor: pointer;
  }
  
  .category-list .item img {
    width: 50px;
    height: 50px;
  }
  </style>
  