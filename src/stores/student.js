import { defineStore } from 'pinia';
import axios from 'axios';

export const useStudentsStore = defineStore('students', {
  state: () => ({
    students: [],
    loading: false,
  }),
  actions: {
    // Actions for manipulating state
    async fetchStudentsData() {
      const token = localStorage.getItem('token');
      // Perform login request to Laravel Passport backend
      await axios.get('http://localhost/damarback/public/api/students', {
        headers: {
          Authorization: `Bearer ${token}` // Set Authorization header with bearer token
        }
      }).then(response => {
          this.students = response.data.data;
      }).catch(error => {
          console.error(error);
      })
    },

    findStudentById(targetId) {
      return this.students.find(student => student.id == targetId) || null;
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