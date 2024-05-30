<template>
    <div class="login">
        <h1>Login</h1>
        <input type="text" v-model="username" placeholder="Username" />
        <input type="password" v-model="password" placeholder="Password" />
        <ButtonAtom className="custom-button" text="Login" @click="login()"/>
        <ButtonAtom className="custom-button" text="Cancel" @clcik="cancel()"/>
    </div>
</template>

<script setup lang="ts">
    import { ref } from 'vue';
    import { useRouter } from 'vue-router';
    import ButtonAtom from './ButtonAtom.vue';

    const props = defineProps<{
        className: string;
    }>();

    const username = ref('');
    const password = ref('');
    const router = useRouter();

    const emits = defineEmits(['click']);

    const login = () => {
        // if (username.value === 'admin' && password.value === 'password') {router.push('/home');} 
        // else {alert('Invalid username or password');}
    };

    const cancel = () => {
        // router.push('/');
    };

</script>

<style scoped>
    .login {
        background-color: #000;
        color: #fff;
        border: 1px solid #d0c377;
        width: 20%;
        height: 30%;
        border-radius: 10px;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-family: Arial, sans-serif;
        font-size: 16px;
        line-height: 1.5;
        text-align: center;
        gap: 10px;
    }

    input{
        width: 77%;
    }

    button {
        display: flex;
        justify-content: space-between;
        align-items: center;
        text-align: center;
    }
</style>