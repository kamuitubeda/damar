<template>
    <f7-page name="student">
        <f7-navbar title="Daftar Siswa" back-link="Back"></f7-navbar>
        <div>
            <f7-searchbar v-if="!loading" search-container=".student-list" search-in=".item-title"></f7-searchbar>
        </div>
        <f7-list v-if="loading" dividers-ios strong-ios outline-ios>
            <div>
                <f7-searchbar class="skeleton-input skeleton-effect-fade"></f7-searchbar>
            </div>
            <f7-list-item
                v-for="n in 10"
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
        <f7-list v-else dividers-ios strong-ios outline-ios class="student-list searchbar-found">
            <f7-list-item
              v-for="student in students"
              :key="student.id"
              :title="student.name"
              :link="`/student/${student.id}/`"
            ></f7-list-item>
        </f7-list>
        <f7-list strong-ios outline-ios dividers-ios class="searchbar-not-found">
            <f7-list-item title="Nothing found" />
        </f7-list>
    </f7-page>
</template>
<script>
import { useStudentsStore } from '../stores/student';

export default {
    data() {
        return {
            students: [],
            loading: false
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
            const studentStore = useStudentsStore();
            this.students = studentStore.students;

            if (!studentStore.students || studentStore.students.length === 0) {
                this.loading = true;
                await studentStore.fetchStudentsData();
                this.students = studentStore.students;
                this.loading = false;
            }
        },
    },
};


</script>
  