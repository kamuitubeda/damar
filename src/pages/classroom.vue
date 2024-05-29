<template>
    <f7-page name="classroom">
        <f7-navbar title="Ruang Kelas" back-link="Back"></f7-navbar>
        <div>
            <f7-searchbar v-if="!loading" search-container=".classroom-list" search-in=".item-title"></f7-searchbar>
        </div>
        <f7-list v-if="loading" dividers-ios strong-ios outline-ios>
            <div>
                <f7-searchbar class="skeleton-input skeleton-effect-fade"></f7-searchbar>
            </div>
            <f7-list-item
                v-for="n in 7"
                :key="n"
                class="skeleton-text skeleton-effect-fade"
                title="Full Name"
                subtitle="Position"
              >
              <template #media>
                <f7-skeleton-block style="width: 40px; height: 40px; border-radius: 50%" />
              </template>
            </f7-list-item>
        </f7-list>
        <f7-list v-else dividers-ios strong-ios outline-ios class="classroom-list searchbar-found">
            <f7-list-item
              v-for="classroom in classrooms"
              :key="classroom.id"
              :title="classroom.level + ' ' + classroom.name"
              :link="`/classroom/${classroom.id}/`"
            ></f7-list-item>
        </f7-list>
    </f7-page>
</template>
<script>
import { useClassroomsStore } from '../stores/classroom';
import { useStudentClassesStore } from '../stores/studentclass';

export default {
    data() {
        return {
            classrooms: [],
            studentclasses: [],
            loading: false,
        };
    },
    async mounted() {
      await this.init();
    },
    props: {
        f7router: Object,
    },
    methods: {
        async init() {
            this.loading = true;

            const classroomStore = useClassroomsStore();
            this.classrooms = classroomStore.classrooms;

            if (!classroomStore.classrooms || classroomStore.classrooms.length === 0) {
                await classroomStore.fetchClassroomsData();
                this.classrooms = classroomStore.classrooms;
            }

            const studentStore = useStudentClassesStore();
            this.studentclasses = studentStore.studentclasses;

            if (!studentStore.studentclasses || studentStore.studentclasses.length === 0) {
                await studentStore.fetchStudentClassesData();
                this.studentclasses = studentStore.studentclasses;
            }

            this.loading = false;
        },
    },
};
</script>
  