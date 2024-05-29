import { defineStore } from 'pinia';
import { supabase } from '../js/supabase.js'

export const useStudentsStore = defineStore('students', {
  state: () => ({
    students: [],
    loading: false,
  }),
  actions: {
    // Actions for manipulating state
    async fetchStudentsData() {
      const { data, error } = await supabase
        .from('students')
        .select('*')
      
      if (error) {
        console.error('Error fetching data:', error)
      } else {
        this.students = data
      }
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