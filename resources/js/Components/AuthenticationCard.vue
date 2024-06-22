<script setup>
import { ref, onMounted } from 'vue';
import DarkModeSwitch from '@/Components/DarkModeSwitch.vue';

const isDark = ref(JSON.parse(localStorage.getItem('isDark')) || false);

const switchTheme = (newState) => {
    isDark.value = newState;
    if (isDark.value) {
        document.documentElement.classList.add('dark');
    } else {
        document.documentElement.classList.remove('dark');
    }
    localStorage.setItem('isDark', JSON.stringify(isDark.value));
};

onMounted(() => {
    if (isDark.value) {
        document.documentElement.classList.add('dark');
    } else {
        document.documentElement.classList.remove('dark');
    }
});
</script>

<template>
    <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gray-100 dark:bg-gray-900">
        <div>
            <slot name="logo" />
        </div>

        <div class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white dark:bg-gray-800 shadow-md overflow-hidden sm:rounded-lg">
            <slot />
        </div>
        <!-- Dark Mode Switch -->
        <div class="fixed top-4 right-12">
            <DarkModeSwitch :initialState="isDark" @switched="switchTheme"/>
        </div>
    </div>
</template>
