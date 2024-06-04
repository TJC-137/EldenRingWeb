<template>
    <div class="register">
        <h1>Register</h1>
        <input type="text" v-model="username" placeholder="Username" />
        <input type="email" v-model="email" placeholder="Email" />
        <input type="password" v-model="password" placeholder="Password" />
        <div v-if="error" class="errors">
            <ul>
                <li v-for="(err, index) in errors" :key="index">{{ err }}</li>
            </ul>
        </div>
        <div class="buttons">
            <ButtonAtom className="custom-button" text="Register" @click="register()"/>
            <ButtonAtom className="custom-button" text="Cancel" @click="cancelRegister()"/>
        </div>


        

    </div>
</template>

<script lang="ts" setup>
    import { ref } from 'vue';
    import { useRouter } from 'vue-router';
    import ButtonAtom from './ButtonAtom.vue';

    const username = ref('');
    const email = ref('');
    const password = ref('');
    const errors = ref([]);
    const error = ref(false);
    const router = useRouter();

    const emits = defineEmits(['click']);

    const register = async () => {
        const userData = {
            name: username.value,
            email: email.value,
            password: password.value,
        };

        try {
            const response = await fetch('http://127.0.0.1:8000/api/users', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userData),
            });

            const result = await response.json();
            console.log('Registro exitoso:', result);

            if(result.status === 'success'){
                console.log('Usuario registrado exitosamente');
                router.push({ name: 'home' });
            }

            if(result.status === 'error'){
                console.log(errors.value)
                errors.value = result.message;
                error.value = true;
            }


        } catch (error) {
            console.error('Error al registrar el usuario:', error);
        }
    };

    const cancelRegister = () => {
        router.push('/');
    };

</script>

<style scoped>
    .register {
        background-color: #00000092;
        color: #fff;
        border: 1px solid #d0c377;
        width: 500px;
        height: 40%;
        padding: 20px;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-family: 'garamond';
        font-size: 16px;
        line-height: 1.5;
        text-align: center;
        gap: 20px;
        margin: auto;

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

    .buttons {
        display: flex;
        gap: 20px;
    }

    .errors {
        color: rgb(203, 19, 19);
    }

    ul{
        list-style: none;
    }
    
    @media screen and (max-width: 768px) {
        .register {
            width: 80%;
        }
        
    }

</style>