<template>
  <f7-page>
    <f7-navbar :title="titleName" back-link="Back"></f7-navbar>
    <f7-block strong inset>
      <b>Daftar Siswa {{ classroom.name }}</b>
    </f7-block>
    <f7-block>
      <f7-list dividers-ios strong-ios outline-ios class="classroom-list searchbar-found">
          <f7-list-item
            v-for="student in students"
            :key="student.id"
            :title="student.name"
            :link="`/student/${student.id}/`"
          ></f7-list-item>
      </f7-list>
    </f7-block>
  </f7-page>
</template>
<script>
import { useClassroomsStore } from '../stores/classroom';
import { useStudentClassesStore } from '../stores/studentclass';

export default {
  data() {
      return {
          titleName: '',
          classroom: {},
          students: [],
          loading: true,
      };
  },
  async mounted() {
      await this.init();
  },
  props: {
      f7route: Object,
      f7router: Object,
  },
  methods: {
      async init() {
          this.loading = true;
          const classroomId = this.f7route.params.id;

          const classroomStore = useClassroomsStore();
          this.classroom = classroomStore.findClassroomById(classroomId);
          this.titleName = "Detail " + this.classroom.name;

          const studentStore = useStudentClassesStore();
          this.students = studentStore.listAllStudentByClassId(classroomId);

          this.loading = false;
      },
  },
};
</script>
