<!-- CategoryBar.vue -->

<template>
    <div class="categories">
      <BoxAtom
        v-for="category in categories"
        :key="category.name"
        :itemName="category.name"
        :imageUrl="category.imageUrl"
        :className="props.className"
        :category="category" 
        @click="handleCategoryClick(category.category)"
      />
    </div>
</template>
  
<script setup lang="ts">
    import { defineEmits, defineProps } from 'vue';
    import { useRouter } from 'vue-router';
    import BoxAtom from '../Atoms/BoxAtom.vue';
    
    
    const props = defineProps<{
        className: string;
    }>();
    
    

    const categories = [
        { name: "ITEMS", imageUrl: "/src/media/categories/grace.png", category: "items" },
        { name: "TALISMANS", imageUrl: "/src/media/categories/talismans.png", category: "talismans" },
        { name: "WEAPONS", imageUrl: "/src/media/categories/weapons.png", category: "weapons" },
        { name: "ARMORS", imageUrl: "/src/media/categories/armors.png", category: "armors" },
        { name: "ARROWS AND BOLTS", imageUrl: "/src/media/categories/ammos.png", category: "ammos" },
        { name: "INCANTATIONS", imageUrl: "/src/media/categories/incantations.png", category: "incantations" },
        { name: "SORCERIES", imageUrl: "/src/media/categories/sorceries.png", category: "sorceries" },
        { name: "SPIRITS", imageUrl: "/src/media/categories/spirits.png", category: "spirits" },
        { name: "CHARACTERS", imageUrl: "/src/media/categories/characters.png", category: "characters" },
        { name: "BOSSES", imageUrl: "/src/media/categories/bosses.png", category: "bosses" },
    ];
    
    
    const router = useRouter();
    const emits = defineEmits(['click']);
    
    
    const handleCategoryClick = (category: string) => {
        console.log("Clicked category:", category); 
        emits("click", category);
        router.push({ name: 'categories', params: { category: category} });  
    };

</script>
  
<style scoped>
    .categories {
        color: rgb(218, 217, 217, 0.8);
        grid-template-columns: repeat(5, 1fr);
        display: grid;
        margin-top: 10%;
        grid-gap: 10px;
        padding: 10px;
        width: 100%;
        height: 25%;
    }
    
    @media screen and (max-width: 768px) {
        .categories {
            grid-template-columns: repeat(2, 1fr);
        }
    }
</style>
  