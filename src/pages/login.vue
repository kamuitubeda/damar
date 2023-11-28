<!-- src/components/LoginPage.vue -->

<template>
    <f7-page>
        <f7-page-content class="login-page-content">
          <!-- Vertically Centered Login Form -->
          <div class="login-form-container">
            <!-- Your login form goes here -->
            <div class="item-media"><img src="icons/256x256.png" width="150" /></div>
            <f7-list strong-ios dividers-ios inset-ios>
                <f7-list-input
                    outline
                    label="Email"
                    floating-label
                    type="email"
                    placeholder="Your email"
                    clear-button
                    v-model:value="email"
                >
                    <template #media>
                      <f7-icon icon="demo-list-icon" />
                    </template>
                </f7-list-input>
                <f7-list-input
                    outline
                    label="Password"
                    floating-label
                    type="password"
                    placeholder="Your password"
                    clear-button
                    v-model:value="password"
                    v-on:keydown.enter="login"
                >
                    <template #media>
                      <f7-icon icon="demo-list-icon" />
                    </template>
                </f7-list-input>
                <f7-list-button>
                    <f7-button preloader :loading="isLoading" large fill grid-gap @click="login">Login</f7-button>
                </f7-list-button>
            </f7-list>
          </div>
        </f7-page-content>
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
                isLoading: false,
            };
        },
        props: {
            f7router: Object,
        },
        mounted() {
          this.init();
        },
        methods: {
            init() {
                const token = localStorage.getItem('token');

                if (token) {
                    // Token is present, attempt to verify authentication
                    axios.get('http://localhost/damarback/public/api/me', {
                      headers: {
                        Authorization: `Bearer ${token}`
                      }
                    })
                    .then(response => {
                      if (response.status === 200) {
                        // Authentication successful, redirect to dashboard or homepage
                        f7.views.main.router.navigate('/');
                      } else {
                        // Authentication failed, remove token and proceed with login
                        localStorage.removeItem('token');
                      }
                    })
                    .catch(error => {
                      console.error('Failed to verify authentication:', error);
                      localStorage.removeItem('token');
                    });
                }
            },
            login() {
                this.isLoading = true;
                // Perform login request to Laravel Passport backend
                axios.post('http://localhost/damarback/public/api/login', {
                    email: this.email,
                    password: this.password,
                })
                .then(response => {
                    this.isLoading = false;
                    const token = response.data.data.token;
                    // Store the token in LocalStorage or Vuex (for a more advanced state management)
                    localStorage.setItem('token', token);
                    
                    // Navigate to the home page or perform other actions
                    f7.views.main.router.navigate('/');
                })
                .catch(error => {
                console.error(error);
                // Display an error message
                    this.isLoading = false;
                    f7.dialog.alert('Login failed. Please check your email and password.');
                });
            },
        },
    };
</script>
<style scoped>
.login-page-content {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh; /* 100% viewport height */
}

.login-form-container {
  text-align: center;
  max-width: 500px; /* Set a maximum width for the login form container if needed */
  width: 100%;
  margin: auto; /* Center the container horizontally */
}
</style>
  