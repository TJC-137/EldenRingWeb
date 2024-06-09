<template>
    <div class="paginator">
      <label for="items-per-page">Items per page:</label>
      <select v-model="itemsPerPage" @change="updatePageCount">
        <option v-for="option in pageOptions" :key="option" :value="option">{{ option }}</option>
      </select>
      <span>{{ startItem }} - {{ endItem }} of {{ totalItems }}</span>
      <button @click="goToFirstPage" :disabled="currentPage === 1">&laquo;</button>
      <button @click="prevPage" :disabled="currentPage === 1">&lt;</button>
      <button @click="nextPage" :disabled="currentPage === pageCount">&gt;</button>
      <button @click="goToLastPage" :disabled="currentPage === pageCount">&raquo;</button>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { ref, watch, computed } from 'vue';
  
  const props = defineProps({
    totalItems: {
      type: Number,
      required: true
    },
    itemsPerPage: {
      type: Number,
      required: true
    },
    modelValue: {
      type: Number,
      required: true
    }
  });
  
  const emit = defineEmits(['update:modelValue', 'update:itemsPerPage']);
  
  const itemsPerPage = ref(props.itemsPerPage);
  const currentPage = ref(props.modelValue);
  const pageOptions = [1, 3, 5, 10, 15]; // Opciones de items por página
  
  const pageCount = computed(() => Math.ceil(props.totalItems / itemsPerPage.value));
  
  const startItem = computed(() => (currentPage.value - 1) * itemsPerPage.value + 1);
  const endItem = computed(() => Math.min(currentPage.value * itemsPerPage.value, props.totalItems));
  
  const updatePageCount = () => {
    currentPage.value = 1;
    emit('update:modelValue', currentPage.value);
    emit('update:itemsPerPage', itemsPerPage.value);
  };
  
  const prevPage = () => {
    if (currentPage.value > 1) {
      currentPage.value--;
      emit('update:modelValue', currentPage.value);
    }
  };
  
  const nextPage = () => {
    if (currentPage.value < pageCount.value) {
      currentPage.value++;
      emit('update:modelValue', currentPage.value);
    }
  };
  
  const goToFirstPage = () => {
    currentPage.value = 1;
    emit('update:modelValue', currentPage.value);
  };
  
  const goToLastPage = () => {
    currentPage.value = pageCount.value;
    emit('update:modelValue', currentPage.value);
  };
  
  watch(() => props.modelValue, (newValue) => {
    currentPage.value = newValue;
  });
  
  watch(itemsPerPage, (newValue) => {
    updatePageCount();
  });
  </script>
  
  <style scoped>
  .paginator {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 20px;
  }
  
  .paginator label {
    margin-right: 10px;
    color: #bbb; /* Cambia el color del texto del label */
  }
  
  .paginator select {
    margin-right: 10px;
    background-color: #333;
    color: #e1c680;
    border: 1px solid #e1c680;
    padding: 5px;
  }
  
  .paginator span {
    margin-right: 10px;
    color: #bbb;
  }
  
  .paginator button {
    background-color: #3a3a3a;
    border: none;
    color: #e1c680;
    padding: 5px 10px;
    margin: 0 5px;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  
  .paginator button:hover {
    color: #333;
    background-color: #e1c680;
  }
  
  .paginator button:disabled {
    background-color: #60606097;
    cursor: not-allowed;
  }

  @media screen and (max-width: 768px) {

    .paginator button {
      padding: 5px 5px;
      display: flex;
      margin-top: 10px;
    }

    .paginator span {
      margin-top: 10px;
    }
    
  }
  </style>
  