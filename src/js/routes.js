import HomePage from '../pages/home.vue';
import LoginPage from '../pages/login.vue';
import ClassroomPage from '../pages/classroom.vue';
import ClassroomDetailPage from '../pages/classroom-detail.vue';
import StudentPage from '../pages/student.vue';
import StudentDetailPage from '../pages/student-detail.vue';
import AttendancePage from '../pages/attendance.vue';
import BillingPage from '../pages/billing.vue';
import AgendaHarianPage from '../pages/agenda-harian.vue';

import AboutPage from '../pages/about.vue';
import FormPage from '../pages/form.vue';
import CatalogPage from '../pages/catalog.vue';
import ProductPage from '../pages/product.vue';
import SettingsPage from '../pages/settings.vue';

import DynamicRoutePage from '../pages/dynamic-route.vue';
import RequestAndLoad from '../pages/request-and-load.vue';
import NotFoundPage from '../pages/404.vue';

var routes = [
  {
    path: '/',
    component: HomePage,
  },
  {
    path: '/login/',
    component: LoginPage,
  },
  {
    path: '/classroom/',
    component: ClassroomPage,
  },
  {
    path: '/classroom/:id/',
    component: ClassroomDetailPage,
  },
  {
    path: '/student/',
    component: StudentPage,
  },
  {
    path: '/student/:id/',
    component: StudentDetailPage,
  },
  {
    path: '/attendance/',
    component: AttendancePage,
  },
  {
    path: '/billing/',
    component: BillingPage,
  },
  {
    path: '/agenda-harian/',
    component: AgendaHarianPage,
  },
  {
    path: '/about/',
    component: AboutPage,
  },
  {
    path: '/form/',
    component: FormPage,
  },
  {
    path: '/catalog/',
    component: CatalogPage,
  },
  {
    path: '/product/:id/',
    component: ProductPage,
  },
  {
    path: '/settings/',
    component: SettingsPage,
  },

  {
    path: '/dynamic-route/blog/:blogId/post/:postId/',
    component: DynamicRoutePage,
  },
  {
    path: '/request-and-load/user/:userId/',
    async: function ({ router, to, resolve }) {
      // App instance
      var app = router.app;

      // Show Preloader
      app.preloader.show();

      // User ID from request
      var userId = to.params.userId;

      // Simulate Ajax Request
      setTimeout(function () {
        // We got user data from request
        var user = {
          firstName: 'Vladimir',
          lastName: 'Kharlampidi',
          about: 'Hello, i am creator of Framework7! Hope you like it!',
          links: [
            {
              title: 'Framework7 Website',
              url: 'http://framework7.io',
            },
            {
              title: 'Framework7 Forum',
              url: 'http://forum.framework7.io',
            },
          ]
        };
        // Hide Preloader
        app.preloader.hide();

        // Resolve route to load page
        resolve(
          {
            component: RequestAndLoad,
          },
          {
            props: {
              user: user,
            }
          }
        );
      }, 1000);
    },
  },
  {
    path: '(.*)',
    component: NotFoundPage,
  },
];

export default routes;
