<template>
    <div class="user-edit-form">
      <h2>Edit User</h2>
      <form @submit.prevent="submitForm">

        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" v-model="formData.name" id="name" required />
        </div>
  
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" v-model="formData.email" id="email" required />
        </div>
  
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" v-model="formData.password" id="password" required />
        </div>
  
        <div class="form-group">
          <label for="photo">Photo</label>
          <input type="file" @change="handleFileChange" id="photo" />
        </div>
  
        <button type="submit">Save Changes</button>
      </form>
    </div>
  </template>

  <script lang="ts" setup>

    import { ref } from 'vue';
    import { useRouter } from 'vue-router';
    import ButtonAtom from './ButtonAtom.vue';

    const id = ref(0);

    const router = useRouter();
    const data = localStorage.getItem('data');
        if (data) {
        try {     
        const parsedData = JSON.parse(data); // Parsear la cadena JSON a un objeto
        console.log(parsedData);
        id.value = parsedData.id; 
        console.log(id);
        } catch (error) {
        console.error('Failed to parse data:', error);
        }
    };

    const formData = ref({
      name: '',
      email: '',
      password: '',
      photo: null,
    });

    const handleFileChange = (event: Event) => {
    //   const file = (event.target as HTMLInputElement).files?.[0];
    //   if (file) {
    //     formData.value.photo = file;
    //   }
    };

    const submitForm = () => {
      updateName(formData.value);
    };

    const updateName = async (formData : any) => {
      const userData = {
            name: formData.name,
        };

        try {
            const response = await fetch('http://127.0.0.1:8000/api/users/' + id.value + '', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userData),
            });

            const result = await response.json();
            console.log('Registro exitoso:', result);

            
            // if(result.status === 'error'){
            //     console.log(errors.value)
            //     errors.value = result.message;
            //     error.value = true;
            // }


        } catch (error) {
            console.error('Error al editar el usuario:', error);
        }
    };

  </script>

  <style scoped>
    .user-edit-form {
      width: 100%;
      max-width: 360px;
      margin: 0 auto;
    }
  
    .form-group {
      margin-bottom: 20px;
    }
  
    label {
      display: block;
      margin-bottom: 5px;
    }
  
    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 90%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }


  </style>