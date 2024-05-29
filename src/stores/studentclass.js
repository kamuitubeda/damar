import { defineStore } from 'pinia';
import { supabase } from '../js/supabase.js'

export const useStudentClassesStore = defineStore('studentclass', {
  state: () => ({
    studentclasses: [],
    loading: false,
  }),
  actions: {
    // Actions for manipulating state
    async fetchStudentClassesData() {
      const { data, error } = await supabase.rpc('get_classes_with_students');

      if (error) {
        console.error('Error loading classes:', error);
        return;
      } else {
        this.studentclasses = data;
      }
    },

    async listAllStudentByClassId(classId) {
      const { data, error } = await supabase.rpc('get_students_in_class', { classid: classId });

      if (error) {
        console.error('Error loading students:', error);
        return [];
      } else {
        return data;
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