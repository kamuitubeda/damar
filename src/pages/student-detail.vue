<template>
  <f7-page>
    <f7-navbar title="Dynamic Route" back-link="Back"></f7-navbar>
    <f7-block strong inset>
      <ul>
        <li><b>Nama:</b> {{ student.name }}</li>
        <li><b>Alamat:</b> {{ student.address }}</li>
        <li><b>No. Telepon:</b> {{ student.phone }}</li>
      </ul>
    </f7-block>
    <f7-block strong inset>
      <f7-link @click="f7router.back()">Go back via Router API</f7-link>
    </f7-block>
  </f7-page>
</template>
<script>
import { useStudentsStore } from '../stores/store';

export default {
  data() {
      return {
          students: [],
          student: {},
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
          const studentId = this.f7route.params.id;
          const store = useStudentsStore();
          this.student = store.findStudentById(studentId);
          this.loading = false;
      },
  },
};
</script>
