<template>
  <f7-page :page-content="false">
    <f7-navbar title="Detail Santri" back-link="Back"></f7-navbar>
    <f7-toolbar bottom tabbar>
      <f7-link tab-link="#tab-1" tab-link-active>
        <f7-icon class="mt10" f7="person"></f7-icon>
        <span class="mt5">Detail</span>
      </f7-link>
      <f7-link tab-link="#tab-2">
        <f7-icon class="mt10" f7="briefcase_fill"></f7-icon>
        <span class="mt5">Pembayaran</span>
      </f7-link>
      <f7-link tab-link="#tab-3">
        <f7-icon class="mt10" f7="checkmark_shield"></f7-icon>
        <span class="mt5">Absensi</span>
      </f7-link>
    </f7-toolbar>
    <f7-tabs swipeable>
      <f7-tab id="tab-1" class="page-content tab-active">
        <f7-card>
          <f7-card-header>Profil Santri</f7-card-header>
          <f7-card-content>
            <ul>
              <li><b>Nama:</b> {{ student.name }}</li>
              <li><b>Alamat:</b> {{ student.address }}</li>
              <li><b>No. Telepon:</b> {{ student.phone }}</li>
            </ul>
          </f7-card-content>
          <f7-card-footer></f7-card-footer>
        </f7-card>
      </f7-tab>
      <f7-tab id="tab-2" class="page-content">
        <f7-block>
          <h2>Riwayat Pembayaran Santri</h2>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam enim quia molestiae
            facilis laudantium voluptates obcaecati officia cum, sit libero commodi. Ratione illo
            suscipit temporibus sequi iure ad laboriosam accusamus?
          </p>
          <p>
            Saepe explicabo voluptas ducimus provident, doloremque quo totam molestias! Suscipit
            blanditiis eaque exercitationem praesentium reprehenderit, fuga accusamus possimus sed,
            sint facilis ratione quod, qui dignissimos voluptas! Aliquam rerum consequuntur
            deleniti.
          </p>
          <p>
            Totam reprehenderit amet commodi ipsum nam provident doloremque possimus odio itaque,
            est animi culpa modi consequatur reiciendis corporis libero laudantium sed eveniet unde
            delectus a maiores nihil dolores? Natus, perferendis.
          </p>
          <p>
            Atque quis totam repellendus omnis alias magnam corrupti, possimus aspernatur
            perspiciatis quae provident consequatur minima doloremque blanditiis nihil maxime
            ducimus earum autem. Magni animi blanditiis similique iusto, repellat sed quisquam!
          </p>
          <p>
            Suscipit, facere quasi atque totam. Repudiandae facilis at optio atque, rem nam, natus
            ratione cum enim voluptatem suscipit veniam! Repellat, est debitis. Modi nam mollitia
            explicabo, unde aliquid impedit! Adipisci!
          </p>
          <p>
            Deserunt adipisci tempora asperiores, quo, nisi ex delectus vitae consectetur iste
            fugiat iusto dolorem autem. Itaque, ipsa voluptas, a assumenda rem, dolorum porro
            accusantium, officiis veniam nostrum cum cumque impedit.
          </p>
          <p>
            Laborum illum ipsa voluptatibus possimus nesciunt ex consequatur rem, natus ad
            praesentium rerum libero consectetur temporibus cupiditate atque aspernatur, eaque
            provident eligendi quaerat ea soluta doloremque. Iure fugit, minima facere.
          </p>
        </f7-block>
      </f7-tab>
      <f7-tab id="tab-3" class="page-content">
        <f7-block>
          <h2>Riwayat Absensi Santri</h2>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam enim quia molestiae
            facilis laudantium voluptates obcaecati officia cum, sit libero commodi. Ratione illo
            suscipit temporibus sequi iure ad laboriosam accusamus?
          </p>
          <p>
            Saepe explicabo voluptas ducimus provident, doloremque quo totam molestias! Suscipit
            blanditiis eaque exercitationem praesentium reprehenderit, fuga accusamus possimus sed,
            sint facilis ratione quod, qui dignissimos voluptas! Aliquam rerum consequuntur
            deleniti.
          </p>
          <p>
            Totam reprehenderit amet commodi ipsum nam provident doloremque possimus odio itaque,
            est animi culpa modi consequatur reiciendis corporis libero laudantium sed eveniet unde
            delectus a maiores nihil dolores? Natus, perferendis.
          </p>
          <p>
            Atque quis totam repellendus omnis alias magnam corrupti, possimus aspernatur
            perspiciatis quae provident consequatur minima doloremque blanditiis nihil maxime
            ducimus earum autem. Magni animi blanditiis similique iusto, repellat sed quisquam!
          </p>
          <p>
            Suscipit, facere quasi atque totam. Repudiandae facilis at optio atque, rem nam, natus
            ratione cum enim voluptatem suscipit veniam! Repellat, est debitis. Modi nam mollitia
            explicabo, unde aliquid impedit! Adipisci!
          </p>
          <p>
            Deserunt adipisci tempora asperiores, quo, nisi ex delectus vitae consectetur iste
            fugiat iusto dolorem autem. Itaque, ipsa voluptas, a assumenda rem, dolorum porro
            accusantium, officiis veniam nostrum cum cumque impedit.
          </p>
          <p>
            Laborum illum ipsa voluptatibus possimus nesciunt ex consequatur rem, natus ad
            praesentium rerum libero consectetur temporibus cupiditate atque aspernatur, eaque
            provident eligendi quaerat ea soluta doloremque. Iure fugit, minima facere.
          </p>
        </f7-block>
      </f7-tab>
    </f7-tabs>
  </f7-page>
</template>
<script>
import { useStudentsStore } from '../stores/student';

export default {
  data() {
      return {
          students: [],
          student: {},
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
          const studentId = this.f7route.params.id;
          const store = useStudentsStore();
          this.student = store.findStudentById(studentId);
          this.loading = false;
      },
  },
};
</script>
<style>
.mt5 {
  margin-top: 5px;
}
.mt10 {
  margin-top: 10px;
}
</style>