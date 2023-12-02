<template>
  <f7-page>
    <f7-navbar title="Detail Kelas" back-link="Back"></f7-navbar>
    <f7-block strong inset>
      <ul>
        <li><b>Nama:</b> {{ classroom.name }}</li>
      </ul>
    </f7-block>
    <f7-block strong inset>
      <f7-link @click="f7router.back()">Go back via Router API</f7-link>
    </f7-block>
  </f7-page>
</template>
<script>
import { useClassroomsStore } from '../stores/classroom';

export default {
  data() {
      return {
          classrooms: [],
          classroom: {},
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
          const store = useClassroomsStore();
          this.classroom = store.findClassroomById(classroomId);
          this.loading = false;
      },
  },
};
</script>
