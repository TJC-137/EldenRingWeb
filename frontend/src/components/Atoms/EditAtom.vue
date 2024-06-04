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
  
        <div class="buttons">
            <button type="submit" class="save">Save Changes</button>
            <button type="button" class="cancel" @click="cancelEdit">Cancel</button>
        </div>
      </form>
    </div>
  </template>

  <script lang="ts" setup>

    import { ref } from 'vue';
    import { useRouter } from 'vue-router';

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
      photo: null as File | null,
    });

    const handleFileChange = (event: Event) => {
        const file = (event.target as HTMLInputElement).files?.[0];
        if (file) {
            formData.value.photo = file;
        }
    };

    const cancelEdit = () => {
        router.push('/');
    };

    const submitForm = () => {
      updateName(formData.value);
      updateEmail(formData.value);
      updatePassword(formData.value);
      updatePhoto(formData.value);
    };

    // Update Name
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

            if(result.status === 'success'){
                console.log('Usuario editado exitosamente');
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
            console.error('Error al editar el usuario:', error);
        }
    };

    // Update Email
    const updateEmail = async (formData : any) => {
      const userData = {
            email: formData.email,
        };

        try {
            const response = await fetch('http://127.0.0.1:8000/api/users/email/' + id.value + '', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userData),
            });

            const result = await response.json();
            console.log('Registro exitoso:', result);

            if(result.status === 'success'){
                console.log('Usuario editado exitosamente');
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
            console.error('Error al editar el usuario:', error);
        }
    };

    // Update Password
    const updatePassword = async (formData : any) => {
      const userData = {
            password: formData.password,
        };

        try {
            const response = await fetch('http://127.0.0.1:8000/api/users/password/' + id.value + '', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userData),
            });

            const result = await response.json();
            console.log('Registro exitoso:', result);

            if(result.status === 'success'){
                console.log('Usuario editado exitosamente');
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
            console.error('Error al editar el usuario:', error);
        }
    };

    // Update photo

    const updatePhoto = async (formData: any) => {
        const userData = new FormData();
        if (formData.photo) {
            userData.append('foto', formData.photo);
        }

        try {
            const response = await fetch('http://127.0.0.1:8000/api/users/img/' + id.value + '', {
                method: 'POST', // Cambiado a POST para manejar archivos
                body: userData,
            });

            const result = await response.json();
            console.log('Registro exitoso:', result);

            if (result.status === 'success') {
                console.log('Usuario editado exitosamente');
                localStorage.setItem('data', JSON.stringify(result.data)); // Convertir a JSON antes de almacenar
                console.log(result.data);
                router.push({ name: 'home' }).then(() => {
                    window.location.reload(); // Recargar la página
                });
            }
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

    .buttons {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .buttons button {
        padding: 10px 20px;
        border-radius: 5px;
        border: 1px solid #cabba2;
        background-color: #1f1f1f;
        color: #dccbaf;
        cursor: pointer;
    }

    .save:hover {
        background-color: #131313de;
        color: #48972b;
        border: 1px solid #48972b;
    }

    .cancel:hover {
        background-color: #131313de;
        color: #c42323;
        border: 1px solid #c42323;
    }


  </style>