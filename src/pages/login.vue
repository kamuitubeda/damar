<template>
    <f7-page>
        <f7-page-content class="login-page-content">
            <!-- Vertically Centered Login Form -->
            <div v-if="errorMessage" class="error-message">{{ errorMessage }}</div>
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
                        v-on:keydown.enter="signIn"
                    >
                        <template #media>
                          <f7-icon icon="demo-list-icon" />
                        </template>
                    </f7-list-input>
                    <f7-list-button>
                        <f7-button preloader :loading="isLoading" large fill grid-gap @click="signIn">Login</f7-button>
                    </f7-list-button>
                </f7-list>
            </div>
        </f7-page-content>
    </f7-page>
</template>
  
<script>
  import { supabase } from '../js/supabase.js';
  import { f7 } from 'framework7-vue';
  export default {
    data() {
      return {
        email: '',
        password: '',
        isLoading: false,
        errorMessage: ''
      };
    },
    props: {
      f7router: Object,
    },
    mounted() {
      this.init();
    },
    methods: {
      async init() {
        this.isLoading = true;

        const { data, error } = await supabase.auth.getSession()

        if (data.session) {
          this.isLoading = false;
          this.f7router.navigate('/');
        } 

        this.isLoading = false;

        // const session = localStorage.getItem('session');

        // if (session) {
        //   this.isLoading = false;
        //   f7.views.main.router.navigate('/');
        // }
      },
      async signIn(response) {
        this.isLoading = true;
        const { data, error } = await supabase.auth.signInWithPassword({
          email: this.email,
          password: this.password,
        })

        if (error) {
          this.isLoading = false;
          this.errorMessage = error.message;
        } else {
          localStorage.setItem('session', JSON.stringify(data.session));
          this.isLoading = false;
          this.f7router.navigate('/');
        }
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

.error-message {
  color: red;
  margin-top: 10px;
  text-align: center;
}
</style>
  