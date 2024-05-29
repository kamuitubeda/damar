import { defineStore } from 'pinia';
import { supabase } from '../js/supabase.js'

export const useClassroomsStore = defineStore('classrooms', {
  state: () => ({
    classrooms: [],
    loading: false,
  }),
  actions: {
    // Actions for manipulating state
    async fetchClassroomsData() {
      const { data, error } = await supabase
        .from('classes')
        .select('*')
      
      if (error) {
        console.error('Error fetching data:', error)
      } else {
        this.classrooms = data
      }
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