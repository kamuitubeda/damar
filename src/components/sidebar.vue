<!-- Sidebar.vue -->
<template>
  <f7-panel left cover theme-dark>
    <f7-page>
      <f7-list menu-list strong-ios outline-ios>
        <f7-list-item
          link
          title="Kelas"
          @click="openClassroomPage()"
        >
          <template #media>
            <f7-icon f7="house" size="24px"></f7-icon>
          </template>
        </f7-list-item>
        <f7-list-item
          link
          title="Santri"
          @click="openStudentPage()"
        >
          <template #media>
            <f7-icon md="material:person" ios="f7:person_fill" />
          </template>
        </f7-list-item>
        <f7-list-item
          link
          title="Absensi"
          @click="openAttendancePage()"
        >
          <template #media>
            <f7-icon md="material:fact_check" ios="f7:checkmark_square" />
          </template>
        </f7-list-item>
        <f7-list-item
          link
          title="Tagihan"
          @click="openBillingPage()"
        >
          <template #media>
            <f7-icon md="material:receipt_long" ios="f7:square_favorites" />
          </template>
        </f7-list-item>
        <f7-list-item
          link
          title="Pembayaran"
          @click="() => (selectedMenu = 'payment')"
        >
          <template #media>
            <f7-icon md="material:payments" ios="f7:wallet_fill" />
          </template>
        </f7-list-item>
        <f7-list-item
          link
          title="Agenda Harian Santri"
          @click="openAgendaHarianPage()"
        >
          <template #media>
            <f7-icon md="material:event_repeat" ios="f7:clock" />
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
</template>

<script>
import { supabase } from '../js/supabase.js';
import { f7 } from 'framework7-vue';
export default {
  name: 'Sidebar',
  data() {
      return {
          selectedMenu: '',
          isLoading: false
      };
  },
  methods: {
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
    openAttendancePage() {
      this.selectedMenu = "attendance";
      this.f7router.navigate('/attendance/');
      f7.panel.close('left');
    },
    openBillingPage() {
      this.selectedMenu = "billing";
      this.f7router.navigate('/billing/');
      f7.panel.close('left');
    },
    openAgendaHarianPage() {
      this.selectedMenu = "agenda-harian";
      this.f7router.navigate('/agenda-harian/');
      f7.panel.close('left');
    },
    async logout() {
      const { error } = await supabase.auth.signOut();

      if(!error) {
        f7.panel.close('left');
        localStorage.removeItem("session");
        this.f7router.navigate('/login/');
      }
    },
  },
  props: {
    f7router: Object,
  }
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