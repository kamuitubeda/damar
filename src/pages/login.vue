<!-- src/components/LoginPage.vue -->

<template>
    <f7-page>
        <f7-list form>
            <f7-list-input
                label="Email"
                type="email"
                placeholder="Your email"
                v-model:value="email"
            ></f7-list-input>
            <f7-list-input
                label="Password"
                type="password"
                placeholder="Your password"
                v-model:value="password"
            ></f7-list-input>
            </f7-list>
            <f7-list inset>
            <f7-list-button @click="login">Login</f7-list-button>
        </f7-list>
    </f7-page>
</template>
  
<script>
    import axios from 'axios';
    import { f7 } from 'framework7-vue';
    export default {
        data() {
            return {
                email: '',
                password: '',
            };
        },
        props: {
            f7router: Object,
        },
        methods: {
            login() {
                // Perform login request to Laravel Passport backend
                axios.post('http://localhost/damarback/public/api/login', {
                    email: this.email,
                    password: this.password,
                })
                .then(response => {
                    const token = response.data.data.token;
                    // Store the token in LocalStorage or Vuex (for a more advanced state management)
                    localStorage.setItem('token', token);
                    
                    // Navigate to the home page or perform other actions
                    f7.views.main.router.navigate('/');
                })
                .catch(error => {
                console.error(error);
                // Display an error message
                    f7.dialog.alert('Login failed. Please check your email and password.');
                });
            },
        },
    };
  </script>
  