<template>
  <f7-page name="home">
    <!-- Top Navbar -->
    <f7-navbar>
      <f7-nav-left>
        <f7-link icon-ios="f7:menu" icon-md="material:menu" @click="openLeftPanel"></f7-link>
      </f7-nav-left>
      <f7-nav-right style="padding-right: 1em;">
        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-notebook" width="24" height="24" viewBox="0 0 24 24" stroke-width="0.5" stroke="black" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M6 4h11a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-11a1 1 0 0 1 -1 -1v-14a1 1 0 0 1 1 -1m3 0v18" /><path d="M13 8l2 0" /><path d="M13 12l2 0" /></svg>
        <f7-nav-title sliding style="padding-left: 0.25em;"> Pondok Pesantren Darul Maarif</f7-nav-title>
      </f7-nav-right>
    </f7-navbar>
    <!-- Page content-->
    <f7-block>
      <div class="grid grid-cols-3">
        <div class="card dashboard-card">
          <div class="card-content">
            <div class="card-content-inner">
              <div class="row">
                <div class="col-100 col-sm-auto text-center">
                  <div class="icon-circle">
                    <i class="icon f7-icons">doc_text_fill</i>
                  </div>
                </div>
                <div class="col-100 col-sm text-center">
                  <div class="number">5</div>
                  <div class="text">Stars</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="card dashboard-card">
          <div class="card-content">
            <div class="card-content-inner">
              <div class="row">
                <div class="col-100 col-sm-auto text-center">
                  <div class="icon-circle">
                    <i class="icon f7-icons">person_crop_circle_fill_badge_checkmark</i>
                  </div>
                </div>
                <div class="col-100 col-sm text-center">
                  <div class="number">5</div>
                  <div class="text">Stars</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="card dashboard-card">
          <div class="card-content">
            <div class="card-content-inner">
              <div class="row">
                <div class="col-100 col-sm-auto text-center">
                  <div class="icon-circle">
                    <i class="icon f7-icons">creditcard</i>
                  </div>
                </div>
                <div class="col-100 col-sm text-center">
                  <div class="number">5</div>
                  <div class="text">Stars</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </f7-block>

    <!-- Section for Berita dan Pengumuman Terbaru -->
    <f7-block-title class="section-title">Pengumuman Terbaru</f7-block-title>
    <f7-card v-for="(announcement, index) in announcements" :key="index" class="announcement-card">
      <div class="announcement-card-image-container">
        <img :srcset="announcement.image" alt="Announcement Image" class="announcement-card-image" sizes="(max-width: 600px) 600px, (max-width: 1000px) 1000px, 1200px">
      </div>
      <div class="announcement-card-content">
        <div class="announcement-card-header">{{ announcement.title }}</div>
        <p class="announcement-card-content-text">{{ announcement.content }}</p>
      </div>
    </f7-card>



    <!-- Section for Agenda Terdekat -->
    <f7-block-title class="section-title">Agenda Terdekat</f7-block-title>
    <div class="timeline">
      <div class="timeline-item">
        <div class="timeline-item-divider"></div>
        <div class="timeline-item-content">
          <div class="timeline-item-inner">
            <div class="timeline-item-time">17 Juni 2024</div>
            <div class="timeline-item-title">Study Tour Siswa Kelas XII</div>
            <div class="timeline-item-text">
              Study tour ke Jogja dan UIN Sunan Kalijaga bagi siswa MA kelas XII.
            </div>
          </div>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-item-divider"></div>
        <div class="timeline-item-content">
          <div class="timeline-item-inner">
            <div class="timeline-item-time">25 Juni 2024</div>
            <div class="timeline-item-title">Haflah Akhirussanah</div>
            <div class="timeline-item-text">
              Haul Akbar ke-30 dan Haflah Akhirussanah Pondok Pesantren Darul Maarif
            </div>
          </div>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-item-divider"></div>
        <div class="timeline-item-content">
          <div class="timeline-item-inner">
            <div class="timeline-item-time">26 Juni 2024 - 10 Juli 2024</div>
            <div class="timeline-item-title">Libur Pondok dan Sekolah</div>
            <div class="timeline-item-text">
              Semua santri pondok harap kembali pada tanggal 9 Juli 2024. Karena tanggal 10 Juli 2024 pembelajaran sudah mulai aktif.
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Section for Link Cepat -->
    <f7-block-title class="section-title">Link Cepat</f7-block-title>
    <f7-list inset>
      <f7-list-item v-for="(link, index) in quickLinks" :key="index" :title="link.title" :link="link.url"></f7-list-item>
    </f7-list>
    <Sidebar :f7router="f7router" />
  </f7-page>
</template>
<script>
import { f7 } from 'framework7-vue';
import Sidebar from '../components/sidebar.vue';
import { useClassroomsStore } from '../stores/classroom';
import { useStudentsStore } from '../stores/student';

export default {
  components: {
    Sidebar
  },
  data() {
      return {
          isLoading: false,
          selectedMenu: '',
          date: new Date(),
          announcements: [],
          upcomingEvents: [],
          quickLinks: []
      };
  },
  async mounted() {
    await this.init();
    this.announcements = await this.fetchAnnouncements();
    this.upcomingEvents = await this.fetchUpcomingEvents();
    this.quickLinks = await this.fetchQuickLinks();
  },
  methods: {
    openLeftPanel() {
      f7.panel.open('left');
    },
    async init() {
        const classroomStore = useClassroomsStore();

        if (!classroomStore.classrooms || classroomStore.classrooms.length === 0) {
            await classroomStore.fetchClassroomsData();
            this.classrooms = classroomStore.classrooms;
        }

        const studentStore = useStudentsStore();

        if (!studentStore.students || studentStore.students.length === 0) {
            this.loading = true;
            await studentStore.fetchStudentsData();
            this.students = studentStore.students;
            this.loading = false;
        }
    },
    async fetchAnnouncements() {
      // Fetch announcements from your data source
      // Example: return await supabase.from('announcements').select('*');
      return [
        { title: 'Info Pendaftaran Santri Baru', content: 'Untuk santri dan siswa MTs dan MA Darul Maarif tahun pelajaran 2024/2025', image: 'https://via.placeholder.com/600' },
        { title: 'Pengumuman 2', content: 'Isi pengumuman 2', image: 'https://via.placeholder.com/600' }
      ];
    },
    async fetchUpcomingEvents() {
      // Fetch upcoming events from your data source
      // Example: return await supabase.from('events').select('*');
      return [
        { title: 'Study Tour untuk Siswa Kelas XII', date: '2024-06-02' },
        { title: 'Haflah Akhirussanah', date: '2024-06-01' }
      ];
    },
    async fetchQuickLinks() {
      // Fetch quick links from your data source
      // Example: return await supabase.from('quick_links').select('*');
      return [
        { title: 'Link 1', url: '/link1' },
        { title: 'Link 2', url: '/link2' }
      ];
    }
  },
  props: {
    f7router: Object,
  }
};
</script>
<style scoped>
.section-title {
  font-family: 'Montserrat', sans-serif; /* Modern, legible font */
  font-size: 24px; /* Larger font size for title */
  font-weight: bold; /* Bold title */
  color: #333; /* Darker color for contrast */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1); /* Subtle drop shadow */
  padding: 20px; /* Padding for spacing */
  margin-bottom: 20px; /* Margin for separation */
  background-color: #f5f5f5; /* Light background color */
  border-radius: 5px; /* Rounded corners */
}

.section-title:hover {
  background-color: #06a0bb; /* Slightly darker background on hover */
  color: white;
}

/* Card Design */
/* Announcement Card Styles */
.announcement-card {
  cursor: pointer;
}

.announcement-card-image-container {
  height: 200px; /* Adjust height as needed */
}

.announcement-card-image {
  /* Remove border-radius and box-shadow */
  width: 100%; /* Make image full width */
  height: 100%; /* Make image full height */
  object-fit: cover; /* Cover the card without exceeding */
  background-size: cover; /* Cover the background area */
  background-position: center; /* Center the image */
  display: block; /* Ensure image is treated as a block element */
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
  transition: transform 0.3s ease; /* Transition for hover effect */
}

.announcement-card-image:hover {
  transform: scale(1.02); /* Slight zoom on hover */
}

.announcement-card-content {
  background-color: #fff;
  padding: 15px;
}

.announcement-card-header {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px; /* Add margin for spacing */
}

.announcement-card-content-text {
  font-size: 14px;
  line-height: 1.5;
  color: #333;
}

/* Timeline Styles */
.timeline {
  position: relative; /* For positioning the timeline line */
}

.timeline-line {
  position: absolute;
  top: 50%;
  left: 0;
  width: 2px;
  height: 100%;
  background-color: #ddd; /* Adjust color as needed */
}

.timeline-item-content {
  padding: 15px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.timeline-item-content:hover {
  background-color: #06a0bb;
}

.timeline-item-time {
  font-weight: bold;
  margin-right: 15px;
}

.timeline-item-title {
  font-size: 18px; /* Adjust font size as needed */
  font-weight: bold;
}

.timeline-item-text {
  font-size: 14px; /* Adjust font size as needed */
  color: #333; /* Adjust text color as needed */
}

</style>