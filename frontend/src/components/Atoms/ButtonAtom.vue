<!-- ButtonAtom.vue -->

<template>
    <div>
        <button :class="props.className" @click="$emit('click')">{{ $props.text }}</button>
    </div>
</template>

<script setup lang="ts">
    import { defineProps } from 'vue';

    const props = defineProps<{
        className: string;
        text: string;
    }>();

    const emit = defineEmits(['click']);

</script>

<style scoped>
    button {
        border: 1px solid #cabba2;
        background-color: #1f1f1f;
        color: #dccbaf;
        display: absolute;
        justify-content: space-between;
        align-items: center;
        text-align: center;
        margin: 10px;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 5px;
        min-width: 100px;
        max-width: 100px;
        cursor: pointer;
    }

    button:hover {
        color: #f3f3f2;
        background-color: #ab966f;
        border: 1px solid #c9c8c6;
        transition: 0.5s;
        cursor: pointer;
    }
</style>