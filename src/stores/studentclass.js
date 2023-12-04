import { defineStore } from 'pinia';
import axios from 'axios';

export const useStudentClassesStore = defineStore('studentclass', {
  state: () => ({
    studentclasses: [],
    loading: false,
  }),
  actions: {
    // Actions for manipulating state
    async fetchStudentClassesData() {
      const token = localStorage.getItem('token');
      // Perform login request to Laravel Passport backend
      await axios.get('http://localhost/damarback/public/api/class/students', {
        headers: {
          Authorization: `Bearer ${token}` // Set Authorization header with bearer token
        }
      }).then(response => {
          this.studentclasses = response.data.data.classrooms;
      }).catch(error => {
          console.error(error);
      })
    },

    listAllStudentByClassId(classId) {
      const student = this.studentclasses.find(classroom => classroom.id == classId);

      if (student) {
          const studentsInClassroom = student.students;
          return studentsInClassroom;
      } else {
          return null;
      }
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