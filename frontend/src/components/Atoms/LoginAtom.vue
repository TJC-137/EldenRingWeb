<template>
    <div class="login">
        <h1>Login</h1>
        <input type="email" v-model="email" placeholder="Email" />
        <input type="password" v-model="password" placeholder="Password" />
        <div class="buttons">
            <ButtonAtom className="custom-button" text="Login" @click="login()"/>
            <ButtonAtom className="custom-button" text="Cancel" @clcik="cancel()"/>
        </div>
    </div>
</template>

<script lang="ts" setup>
    import { ref } from 'vue';
    import { useRouter } from 'vue-router';
    import ButtonAtom from './ButtonAtom.vue';

    const email = ref('');
    const password = ref('');
    const router = useRouter();

    const emits = defineEmits(['click']);

    const login = async () => {
        const userData = {
            email: email.value,
            password: password.value,
        };

        try {
            const response = await fetch('http://127.0.0.1:8000/api/users/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userData),
            });

            const result = await response.json();
            console.log('Registro exitoso:', result);

            if(result.status === 'Login Ok'){
                console.log('Usuario registrado exitosamente');
                localStorage.setItem('data', JSON.stringify(result.data)); // Convertir a JSON antes de almacenar
                console.log(result.data);
                router.push({ name: 'home' });
            }


            // if(result.status === 'error'){
            //     console.log(errors.value)
            //     errors.value = result.message;
            //     error.value = true;
            // }


        } catch (error) {
            console.error('Error al registrar el usuario:', error);
        }
    };

    const cancel = () => {
        // router.push('/');
    };

</script>

<style scoped>
    .login {
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
        .login {
            width: 80%;
        }
        
    }

</style>