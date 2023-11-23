<template>
  <f7-app v-bind="f7params">
    <f7-view main url="/login/"></f7-view>
  </f7-app>
</template>
<script>
  import { ref, onMounted } from 'vue';
  import { f7, f7ready } from 'framework7-vue';
  import { getDevice }  from 'framework7/lite-bundle';
  import cordovaApp from '../js/cordova-app.js';
  import capacitorApp from '../js/capacitor-app.js';
  import routes from '../js/routes.js';
  import store from '../js/store';

  export default {
    setup() {
      const device = getDevice();
      // Framework7 Parameters
      const f7params = {
        name: 'Damar', // App name
        theme: 'auto', // Automatic theme detection

        // App store
        store: store,
        // App routes
        routes: routes,

        // Register service worker (only on production build)
        serviceWorker: process.env.NODE_ENV ==='production' ? {
          path: '/service-worker.js',
        } : {},
        // Input settings
        input: {
          scrollIntoViewOnFocus: device.capacitor,
          scrollIntoViewCentered: device.capacitor,
        },
        // Capacitor Statusbar settings
        statusbar: {
          iosOverlaysWebView: true,
          androidOverlaysWebView: false,
        },
        // Input settings
        input: {
          scrollIntoViewOnFocus: device.cordova,
          scrollIntoViewCentered: device.cordova,
        },
        // Cordova Statusbar settings
        statusbar: {
          iosOverlaysWebView: true,
          androidOverlaysWebView: false,
        },
      };
      onMounted(() => {
        f7ready(() => {
          // Init cordova APIs (see cordova-app.js)
          if (device.cordova) {
            cordovaApp.init(f7);
          }
          // Init capacitor APIs (see capacitor-app.js)
          if (device.capacitor) {
            capacitorApp.init(f7);
          }
          // Call F7 APIs here
        });
      });

      return {
        f7params
      }
    }
  }
</script>