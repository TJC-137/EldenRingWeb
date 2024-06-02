<template>
  <div class="category-bar" :class="{ 'show': showMenu }">
    <div class="header-logo">
      <div class="menu-icon" @click="closeMenu">
        <img src="../../assets/images/ERicon.png" alt="Elden Ring Logo" class="logo" />
      </div>
      <div class="close-btn" @click="closeMenu">×</div>
    </div>
    <div class="buttons">
      <CustomButton class="custom-button" text="Register" @click="register" />
      <img src="../../assets/images/ERicon.png" alt="Elden Ring Logo" class="logo" />
      <CustomButton class="custom-button" text="Login" @click="login" />
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
  { name: "ITEMS", imageUrl: "src/assets/Icons/Tools.png", category: "Items" },
  { name: "TALISMANS", imageUrl: "src/assets/Icons/Talismans.png", category: "Talismans" },
  { name: "WEAPONS", imageUrl: "src/assets/Icons/Weapons.png", category: "Weapons" },
  { name: "SHIELDS", imageUrl: "src/assets/Icons/Shields.png", category: "Shields" },
  { name: "ARMORS", imageUrl: "src/assets/Icons/Armors.png", category: "Armors" },
  { name: "ARROWS AND BOLTS", imageUrl: "src/assets/Icons/Ammos.png", category: "Ammos" },
  { name: "INCANTATIONS", imageUrl: "src/assets/Icons/Incantations.png", category: "Incantations" },
  { name: "SORCERIES", imageUrl: "src/assets/Icons/Sorceries.png", category: "Sorceries" },
  { name: "SPIRITS", imageUrl: "src/assets/Icons/Spirits.png", category: "Spirits" },
  { name: "ASHES OF WAR", imageUrl: "src/assets/Icons/Ashes.png", category: "Ashes" },
  { name: "CREATURES", imageUrl: "src/assets/Icons/Creatures.png", category: "Creatures" },
  { name: "CHARACTERS", imageUrl: "src/assets/Icons/Npcs.png", category: "Npcs" },
  { name: "BOSSES", imageUrl: "src/assets/Icons/Bosses.png", category: "Bosses" },
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
  router.push({ path: '/register' });
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

.logo {
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

@media screen and (max-width: 768px) {
  .category-bar.show {
    width: -webkit-fill-available;
  }
}
</style>
