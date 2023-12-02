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
              :title="classroom.name"
              :link="`/classroom/${classroom.id}/`"
            ></f7-list-item>
        </f7-list>
    </f7-page>
</template>
<script>
import { useClassroomsStore } from '../stores/classroom';

export default {
    data() {
        return {
            classrooms: [],
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
            const store = useClassroomsStore();
            this.classrooms = store.classrooms;

            if (!store.classrooms || store.classrooms.length === 0) {
                this.loading = true;
                await store.fetchClassroomsData();
                this.classrooms = store.classrooms;
                this.loading = false;
            }
        },
    },
};


  </script>
  