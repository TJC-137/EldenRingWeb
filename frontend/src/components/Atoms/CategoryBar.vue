<template>
  <div class="category-bar" :class="{ 'show': showMenu }">
    <div class="header-logo">
      <div class="menu-icon" @click="closeMenu">
        <img :src="userImg" class="logo" />
      </div>
      <div class="close-btn" @click="closeMenu">×</div>
    </div>
    
    <div class="buttons" v-if="!loggedIn">
      <CustomButton class="custom-button" text="Register" @click="register" />
      <img src="../../assets/images/ERicon.png" alt="Elden Ring Logo" class="logo" />
      <CustomButton class="custom-button" text="Login" @click="login" />
    </div>

    <div class="buttons" v-if="loggedIn">
      <CustomButton class="custom-button" text="Edit" @click="edit" />
      <img src="../../assets/images/ERicon.png" alt="Elden Ring Logo" class="logo" />
      <CustomButton class="custom-button" text="Logout" @click="logout" />
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
import { defineProps, defineEmits, onMounted, ref, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import CustomButton from './ButtonAtom.vue';


const props = defineProps<{
  showMenu: boolean;
}>();

const loggedIn = ref(false);
const userImg = ref("http://127.0.0.1:8000/upload/img/avatar.png");

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
const route = useRoute();

const handleCategoryClick = (category: string) => {
  router.push({ name: 'categories', params: { category: category } });
  emits('closeMenu');
};

// Close menu
const closeMenu = () => {
  emits('closeMenu');
};

// Login
const login = () => {
  console.log("Login clicked");
  router.push({ path: '/login' });
};

// Register
const register = () => {
  console.log("Register clicked");
  router.push({ path: '/register' });
};

// Edit
const edit = () => {
  console.log("Edit clicked");
  router.push({ path: '/edit' });
};

// Logout
const logout = () => {
  console.log("Logout clicked");
  localStorage.removeItem('data');  
  router.push({ name: 'home' }).then(() => {
    window.location.reload();  // Recarga la página
  });
};

// Load user data from local storage
const loadUserData = () => {
  const data = localStorage.getItem('data');
  console.log(data); // Parsear la cadena JSON a un objeto (data);
  if (data) {
    try {     
      const parsedData = JSON.parse(data); // Parsear la cadena JSON a un objeto
      console.log(parsedData);
      const url = parsedData.url; 
      console.log(url);
      userImg.value = url; 
    } catch (error) {
      console.error('Failed to parse data:', error);
    }
    loggedIn.value = true;
  }
};

// Load user data when the component is mounted
onMounted(() => {
  loadUserData();
});

// Reload user data when the route changes
watch(route, (newRoute) => {
  loadUserData();
});
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
  z-index: 1000;
}

.close-btn {
  font-size: 30px;
  cursor: pointer;
  text-align: right;
  z-index: 100;
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
