<template>
  <div class="category-bar" :class="{ 'show': showMenu }">
    <div class="header-logo">
      <div class="menu-icon" @click="closeMenu">
        <img :src="userImg" class="logo" />
        <p class="username">
          <span class="icon" :class="{ 'grayscale': !loggedIn }" alt="status"></span>
          {{ userName }}
        </p>
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

    <div class="spotify" v-if="loggedIn">
      <iframe src="https://open.spotify.com/embed/album/2gCFzRRO5acruR4y4QhIuI?utm_source=generator" 
      style="border-radius:12px"
      width="100%" height="352" 
      frameBorder="0" 
      allowfullscreen="true" 
      allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" 
      loading="lazy"></iframe>
    </div>
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
const userName = ref("");

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
  const data = localStorage.getItem('data'); // Get user data from local storage
  console.log(data);
  if (data) {
    try {    
      // Parsear la cadena JSON a un objeto
      const parsedData = JSON.parse(data); 
      console.log(parsedData);

      // Get user img
      const url = parsedData.url; 
      console.log(url);
      userImg.value = url; 

      // Get user name
      const name = parsedData.name;
      userName.value = name;

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

.category-list .item:hover {
  background-color: #333;
}

.category-list .item:hover img {
  scale: 1.15;
}

.category-list .item:hover p {
  color: #e1c680;
  margin-left: 10px;
}

.menu-icon img{
  width: 52px;
  height: 52px;
  cursor: pointer;
  margin-right: 10px;
  border-radius: 50%;
  margin-left: 0.1rem;
  border: 2px solid #fff;
}

.menu-icon img:hover {
  border: 2px solid #e1c680;
}

.username {
  font-weight: bold;
  margin-right: 10px;
  cursor: pointer;
}

.username:hover {
  color: #e1c680;
}

.icon {
  display: inline-block;
  width: 32px;
  height: 32px;
  background-image: url('../../assets/Icons/online.png');
  background-size: cover;
  background-repeat: no-repeat;
  vertical-align: middle;
  margin-right: 5px;
}

.grayscale {
  filter: grayscale(100%);
}

.spotify {
  margin-bottom: 3rem;
}

@media screen and (max-width: 1024px) {
  .category-bar.show {
    width: -webkit-fill-available;
  }
}

@media screen and (max-width: 768px) {
  .category-bar.show {
    width: -webkit-fill-available;
  }
}
</style>
