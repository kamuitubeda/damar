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
      <div class="grid grid-cols-3 grid-gap">
        <div class="dashboard-header">
          <div class="dashboard-card-title">Absensi</div>
          <a href="#" class="dashboard-card green-card">
            <div class="overlay"></div>
            <div class="circle">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-notebook" width="80" height="80" viewBox="0 0 24 24" stroke-width="0.5" stroke="black" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M6 4h11a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-11a1 1 0 0 1 -1 -1v-14a1 1 0 0 1 1 -1m3 0v18" /><path d="M13 8l2 0" /><path d="M13 12l2 0" /></svg>
            </div>
          </a>
        </div>
        <div class="dashboard-header">
          <div class="dashboard-card-title">Pembayaran</div>
          <a href="#" class="dashboard-card purple-card">
            <div class="overlay"></div>
            <div class="circle">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-cash" width="80" height="80" viewBox="0 0 24 24" stroke-width="0.5" stroke="black" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M7 9m0 2a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v6a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2z" /><path d="M14 14m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M17 9v-2a2 2 0 0 0 -2 -2h-10a2 2 0 0 0 -2 2v6a2 2 0 0 0 2 2h2" /></svg>
            </div>
            <!-- <div class="dashboard-card-title">Pembayaran</div> -->
          </a>
        </div>
        <div class="dashboard-header">
          <div class="dashboard-card-title">Laporan</div>
          <a href="#" class="dashboard-card blue-card">
            <div class="overlay"></div>
            <div class="circle">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-spreadsheet" width="80" height="80" viewBox="0 0 24 24" stroke-width="0.5" stroke="black" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M14 3v4a1 1 0 0 0 1 1h4" /><path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" /><path d="M8 11h8v7h-8z" /><path d="M8 15h8" /><path d="M11 11v7" /></svg>
            </div>
            <!-- <div class="dashboard-card-title">Laporan</div> -->
          </a>
        </div>
      </div>
    </f7-block>
    <f7-block-title>Agenda</f7-block-title>
    <div class="timeline">
      <div class="timeline-item">
        <div class="timeline-item-date">21 <small>DEC</small></div>
        <div class="timeline-item-divider"></div>
        <div class="timeline-item-content">
          <div class="timeline-item-inner">
            <div class="timeline-item-time">12:56</div>
            <div class="timeline-item-title">Item Title</div>
            <div class="timeline-item-subtitle">Item Subtitle</div>
            <div class="timeline-item-text">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor fugiat ipsam hic porro
              enim, accusamus perferendis, quas commodi alias quaerat eius nemo deleniti. Odio quasi
              quos quis iure, aperiam pariatur?
            </div>
          </div>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-item-date">22 <small>DEC</small></div>
        <div class="timeline-item-divider"></div>
        <div class="timeline-item-content">
          <div class="timeline-item-inner">
            <div class="timeline-item-time">12:56</div>
            <div class="timeline-item-title">Item Title</div>
            <div class="timeline-item-subtitle">Item Subtitle</div>
            <div class="timeline-item-text">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor fugiat ipsam hic porro
              enim, accusamus perferendis, quas commodi alias quaerat eius nemo deleniti. Odio quasi
              quos quis iure, aperiam pariatur?
            </div>
          </div>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-item-date">28 <small>DEC</small></div>
        <div class="timeline-item-divider"></div>
        <div class="timeline-item-content">
          <div class="timeline-item-inner">
            <div class="timeline-item-time">12:56</div>
            <div class="timeline-item-title">Item Title</div>
            <div class="timeline-item-subtitle">Item Subtitle</div>
            <div class="timeline-item-text">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor fugiat ipsam hic porro
              enim, accusamus perferendis, quas commodi alias quaerat eius nemo deleniti. Odio quasi
              quos quis iure, aperiam pariatur?
            </div>
          </div>
        </div>
      </div>
    </div>
    <f7-block-title>Navigation</f7-block-title>
    <f7-list strong inset dividersIos>
      <f7-list-item link="/about/" title="About"></f7-list-item>
      <f7-list-item link="/form/" title="Form"></f7-list-item>
      <f7-list-item link="/catalog/" title="Catalog"></f7-list-item>
    </f7-list>

    <f7-block-title>Modals</f7-block-title>
    <f7-block class="grid grid-cols-2 grid-gap">
      <f7-button fill popup-open="#my-popup">Popup</f7-button>
      <f7-button fill login-screen-open="#my-login-screen">Login Screen</f7-button>
    </f7-block>

    <f7-block-title>Panels</f7-block-title>
    <f7-block class="grid grid-cols-2 grid-gap">
      <f7-button fill panel-open="left">Left Panel</f7-button>
      <f7-button fill panel-open="right">Right Panel</f7-button>
    </f7-block>

    <f7-list strong inset dividersIos>
      <f7-list-item
        title="Dynamic (Component) Route"
        link="/dynamic-route/blog/45/post/125/?foo=bar#about"
      ></f7-list-item>
      <f7-list-item
        title="Default Route (404)"
        link="/load-something-that-doesnt-exist/"
      ></f7-list-item>
      <f7-list-item
        title="Request Data & Load"
        link="/request-and-load/user/123456/"
      ></f7-list-item>
    </f7-list>
    <f7-panel left cover theme-dark>
      <f7-page>
        <f7-list menu-list strong-ios outline-ios>
          <f7-list-item
            link
            title="Kelas"
            :selected="selectedMenu === 'classroom'"
            @click="openClassroomPage()"
          >
            <template #media>
              <f7-icon f7="house" size="24px"></f7-icon>
            </template>
          </f7-list-item>
          <f7-list-item
            link
            title="Santri"
            :selected="selectedMenu === 'student'"
            @click="openStudentPage()"
          >
            <template #media>
              <f7-icon md="material:person" ios="f7:person_fill" />
            </template>
          </f7-list-item>
          <f7-list-item
            link
            title="Absen"
            :selected="selectedMenu === 'attendance'"
            @click="() => (selectedMenu = 'attendance')"
          >
            <template #media>
              <f7-icon md="material:settings" ios="f7:gear_alt_fill" />
            </template>
          </f7-list-item>
          <f7-list-item
            link
            title="Pembayaran"
            :selected="selectedMenu === 'billing'"
            @click="() => (selectedMenu = 'billing')"
          >
            <template #media>
              <f7-icon md="material:settings" ios="f7:gear_alt_fill" />
            </template>
          </f7-list-item>
        </f7-list>
        <!-- Sticky button at the bottom -->
        <div class="panel-bottom-button">
          <f7-list strong inset dividersIos>
            <f7-button preloader :loading="isLoading" large fill @click="logout">Logout</f7-button>
          </f7-list>
        </div>
      </f7-page>
    </f7-panel>
  </f7-page>
</template>

<script>
import axios from 'axios';
import { f7 } from 'framework7-vue';
import { Calendar, DatePicker } from 'v-calendar';
import 'v-calendar/style.css';
export default {
  components: {
    Calendar,
    DatePicker,
  },
  data() {
      return {
          isLoading: false,
          selectedMenu: '',
          date: new Date(),
      };
  },
  props: {
    f7router: Object,
  },
  methods: {
    openLeftPanel() {
      f7.panel.open('left');
    },
    openClassroomPage() {
      this.selectedMenu = "classroom";
      this.f7router.navigate('/classroom/');
      f7.panel.close('left');
    },
    openStudentPage() {
      this.selectedMenu = "student";
      this.f7router.navigate('/student/');
      f7.panel.close('left');
    },
    logout() {
      this.isLoading = true;
      const token = localStorage.getItem('token');

      axios.post('http://localhost/damarback/public/api/logout', {}, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then(response => {
        this.isLoading = false;
        if(response.status == 200) {
          localStorage.removeItem('token');
          f7.panel.close('left');
          f7.views.main.router.navigate('/login/');
        }
      })
      .catch(error => {
        f7.panel.close('left');
        this.isLoading = false;
        console.error('Error:', error);
      });
    },
  },
};
</script>
<style scoped>
  /* Add some styling for the sticky button */
  .panel-bottom-button {
    position: absolute;
    bottom: 16px;
    left: 50%;
    transform: translateX(-50%);
    width: calc(100% - 32px);
    text-align: center;
  }
</style>