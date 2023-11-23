<template>
  <f7-page name="home">
    <!-- Top Navbar -->
    <f7-navbar large :sliding="false">
      <f7-nav-left>
        <f7-link icon-ios="f7:menu" icon-md="material:menu" @click="openLeftPanel"></f7-link>
      </f7-nav-left>
      <f7-nav-title sliding>Damar</f7-nav-title>
      <f7-nav-right>
        <f7-link icon-ios="f7:menu" icon-md="material:menu" @click="openRightPanel"></f7-link>
      </f7-nav-right>
      <f7-nav-title-large>Damar</f7-nav-title-large>
    </f7-navbar>

    <!-- Page content-->
    <f7-block>
      <p>This is an example of tabs-layout application. The main point of such tabbed layout is that each tab contains independent view with its own routing and navigation.</p>

      <p>Each tab/view may have different layout, different navbar type (dynamic, fixed or static) or without navbar like this tab.</p>
    </f7-block>
    <f7-block-title>Navigation</f7-block-title>
    <f7-list strong inset dividersIos>
      <f7-list-item link="/about/" title="About"></f7-list-item>
      <f7-list-item link="/form/" title="Form"></f7-list-item>
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
    <f7-panel right cover theme-dark>
      <f7-page>
        <f7-list strong inset dividersIos>
          <f7-button preloader :loading="isLoading" large fill @click="logout">Logout</f7-button>
        </f7-list>
      </f7-page>
    </f7-panel>
    <f7-panel left cover theme-dark>
      <f7-page>
        <f7-panel-header class="custom-panel-header">
          <f7-panel-title>Custom Side Panel</f7-panel-title>
          <f7-button @click="closeSidePanel">Close</f7-button>
        </f7-panel-header>
        <div class="custom-empty-area"></div>
        <f7-panel-footer class="custom-panel-footer">
          <f7-button>Button 1</f7-button>
          <f7-button>Button 2</f7-button>
          <f7-button>Button 3</f7-button>
        </f7-panel-footer>
      </f7-page>
    </f7-panel>
  </f7-page>
</template>

<script>
import axios from 'axios';
import { f7 } from 'framework7-vue';
export default {
  data() {
      return {
          isLoading: false
      };
  },
  methods: {
    openLeftPanel() {
      f7.panel.open('left');
    },
    openRightPanel() {
      f7.panel.open('right');
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
          f7.panel.close('right');
          localStorage.removeItem('token');
          f7.views.main.router.navigate('/login/');
        }
      })
      .catch(error => {
        this.isLoading = false;
        console.error('Error:', error);
      });
    },
  },
};
</script>
<style scoped>
.custom-panel-header,
.custom-panel-footer {
  /* Style the header and footer */
  display: flex;
  justify-content: space-between;
  padding: 10px 20px;
}
.custom-empty-area {
  /* Style the empty middle area */
  flex-grow: 1;
}
</style>