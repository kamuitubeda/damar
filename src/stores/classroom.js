import { defineStore } from 'pinia';
import axios from 'axios';

export const useClassroomsStore = defineStore('classrooms', {
  state: () => ({
    classrooms: [],
    loading: false,
  }),
  actions: {
    // Actions for manipulating state
    async fetchClassroomsData() {
      const token = localStorage.getItem('token');
      // Perform login request to Laravel Passport backend
      await axios.get('http://localhost/damarback/public/api/classrooms', {
        headers: {
          Authorization: `Bearer ${token}` // Set Authorization header with bearer token
        }
      }).then(response => {
          this.classrooms = response.data.data;
      }).catch(error => {
          console.error(error);
      })
    },

    findClassroomById(targetId) {
      return this.classrooms.find(classroom => classroom.id == targetId) || null;
    },

    login() {
      // Update the isLoggedIn state variable
    },
    logout() {
      // Update the isLoggedIn state variable
      // Reset userData to null
    },
  },
});

 // default useStudentsStore;