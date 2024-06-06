<template>
    <div class="comment">
      <img :src="comment.userImage" alt="User Image" class="user-image" />
      <div class="comment-content">
        <h4>{{ comment.userName }}</h4>
        <p>{{ comment.text }}</p>
      </div>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { defineProps } from 'vue';
  
  const props = defineProps({
    comment: {
      type: Object,
      required: true
    }
  });
  </script>
  
  <style scoped>
  .comment {
    display: flex;
    align-items: flex-start;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 100%;
  }
  
  .user-image {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 10px;
  }
  
  .comment-content {
    display: flex;
    flex-direction: column;
  }
  
  .comment-content h4 {
    margin: 0;
    font-size: 16px;
  }
  
  .comment-content p {
    margin: 5px 0 0;
    font-size: 14px;
  }

  </style>
  