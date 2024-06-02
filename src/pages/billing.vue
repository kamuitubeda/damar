<template>
    <f7-page name="tagihan">
      <f7-navbar title="Tagihan" back-link="Back"></f7-navbar>
      <div class="billing-page">
        <div class="billing-header">
            <f7-input
                type="search"
                placeholder="Cari siswa..."
                v-model="searchQuery"
                @input="filterBills"
                class="search-input"
            />
            <f7-segmented class="full-width-segmented" raised>
                <f7-button
                :active="viewMode === 'all'"
                @click="viewMode = 'all'; filterBills();"
                >
                Semua Tagihan
                </f7-button>
                <f7-button
                :active="viewMode === 'unpaid'"
                @click="viewMode = 'unpaid'; filterBills();"
                >
                Belum Dibayar
                </f7-button>
                <f7-button
                :active="viewMode === 'paid'"
                @click="viewMode = 'paid'; filterBills();"
                >
                Sudah Dibayar
                </f7-button>
            </f7-segmented>
            <f7-list class="filter-list">
                <f7-list-item title="Pilih Jenis Tagihan" smart-select :smart-select-params="{ closeOnSelect: true }">
                    <select v-model="selectedBillType" @change="filterBills">
                    <option value="">Semua Jenis Tagihan</option>
                    <option
                        v-for="type in billTypes"
                        :key="type"
                        :value="type"
                    >
                        {{ type }}
                    </option>
                    </select>
                </f7-list-item>
                <f7-list-item title="Pilih Kelas" smart-select :smart-select-params="{ closeOnSelect: true }">
                    <select v-model="selectedClass" @change="filterBills">
                    <option value="">Semua Kelas</option>
                    <option
                        v-for="classOption in classOptions"
                        :key="classOption.value"
                        :value="classOption.value"
                    >
                        {{ classOption.text }}
                    </option>
                    </select>
                </f7-list-item>
            </f7-list>
        </div>
        <div class="billing-list">
            <f7-card
            v-for="(bill, index) in filteredBills"
            :key="index"
            class="billing-card"
            >
                <div class="billing-card-content">
                    <div class="billing-info">
                        <div class="billing-card-top">
                            <div class="student-name">{{ bill.studentName }}</div>
                            <div class="billing-status">
                                <div class="card-badge" v-if="bill.status === 'paid'">
                                    <f7-badge class="payment-badge">Lunas</f7-badge>
                                </div>
                                <div class="billing-actions" v-if="bill.status === 'unpaid'">
                                    <f7-button
                                        fill
                                        small
                                        class="payment-button"
                                        @click="markAsPaid(bill)"
                                    >
                                        Tandai Lunas
                                    </f7-button>
                                </div>
                            </div>
                        </div>
                        <div class="bill-detail">Detail Tagihan: {{ bill.detail }}</div>
                        <div class="bill-date-amount">
                            <div class="bill-due-date">Jatuh Tempo: {{ bill.dueDate }}</div>
                            <div class="bill-amount">Jumlah: <strong>{{ formatCurrency(bill.amount) }}</strong></div>
                        </div>
                    </div>
                </div>
            </f7-card>
        </div>
      </div>
    </f7-page>
</template>
  
  
<script>
export default {
  data() {
    return {
        searchQuery: '',
      viewMode: 'all',
      selectedBillType: '',
      selectedClass: '',
      userType: 'admin', // 'parent' or 'admin'
      userId: 1, // example user ID, this should come from the authentication context
      students: [
        // This should be fetched from an API based on the authenticated user
        { id: 1, name: 'Harry Potter', class: 'gryffindor-year-1', parentId: 1 },
        { id: 2, name: 'Hermione Granger', class: 'gryffindor-year-1', parentId: 2 },
        { id: 3, name: 'Ron Weasley', class: 'gryffindor-year-1', parentId: 1 },
      ],
      bills: [
        // This should be fetched from an API
        { studentId: 1, studentName: 'Harry Potter', detail: 'Buku Sekolah', amount: 500000, status: 'unpaid', dueDate: '2024-07-10', type: 'Buku' },
        { studentId: 2, studentName: 'Hermione Granger', detail: 'Seragam Olahraga', amount: 450000, status: 'paid', dueDate: '2024-06-01', type: 'Seragam' },
        { studentId: 3, studentName: 'Ron Weasley', detail: 'Kegiatan Ekstrakurikuler', amount: 500000, status: 'unpaid', dueDate: '2024-07-15', type: 'Kegiatan' },
      ],
      classOptions: [
        { text: 'Gryffindor - Year 1', value: 'gryffindor-year-1' },
        { text: 'Slytherin - Year 2', value: 'slytherin-year-2' },
        // Tambahkan kelas lainnya di sini
      ],
      billTypes: [
        'Buku', 'Seragam', 'Kegiatan',
        // Tambahkan jenis tagihan lainnya di sini
      ],
      filteredBills: []
    };
  },
  methods: {
    filterBills() {
      let bills = this.bills;
      
      // Filter by search query
      if (this.searchQuery) {
        bills = bills.filter(bill => 
          bill.studentName.toLowerCase().includes(this.searchQuery.toLowerCase())
        );
      }
      
      // Filter by user type
      if (this.userType === 'parent') {
        const childrenIds = this.students
          .filter(student => student.parentId === this.userId)
          .map(student => student.id);
        bills = bills.filter(bill => childrenIds.includes(bill.studentId));
      }
      
      // Filter by view mode
      if (this.viewMode === 'unpaid') {
        bills = bills.filter(bill => bill.status === 'unpaid');
      } else if (this.viewMode === 'paid') {
        bills = bills.filter(bill => bill.status === 'paid');
      }

      // Filter by bill type
      if (this.selectedBillType) {
        bills = bills.filter(bill => bill.type === this.selectedBillType);
      }

      // Filter by class
      if (this.selectedClass) {
        bills = bills.filter(bill => {
          const student = this.students.find(student => student.id === bill.studentId);
          return student && student.class === this.selectedClass;
        });
      }

      this.filteredBills = bills;
    },
    markAsPaid(bill) {
      bill.status = 'paid';
      this.filterBills();
    },
    formatCurrency(amount) {
      return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(amount);
    }
  },
  created() {
    this.filterBills();
  }
};
</script>
  
<style scoped>
.billing-page {
  padding: 20px;
  background-color: #f8f9fa;
}

.billing-header {
  display: flex;
  flex-direction: column;
  margin-bottom: 20px;
}

.search-input {
  padding: 15px;
  border-radius: 8px;
  border: 1px solid #ddd;
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
  margin-bottom: 10px;
}

.full-width-segmented {
  display: flex;
  width: 100%;
}

.full-width-segmented .f7-button {
  flex: 1;
  text-align: center;
  padding: 10px 0;
}

.billing-list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: space-between;
}

.billing-card {
  width: calc(33.333% - 20px);
  min-width: 300px;
  box-sizing: border-box;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  position: relative;
  transition: transform 0.3s, box-shadow 0.3s;
}

.billing-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
}

.billing-card-content {
  padding: 20px;
}

.billing-info {
  display: flex;
  flex-direction: column;
}

.billing-card-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 5px;
}

.student-name {
  font-size: 18px;
  font-weight: bold;
}

.bill-detail {
  font-size: 14px;
  color: #666;
}

.bill-date-amount {
  display: flex;
  justify-content: space-between;
  width: 100%;
}

.bill-due-date {
  font-size: 14px;
  color: #666;
}

.bill-amount {
  font-size: 14px;
  color: #666;
}

.payment-button {
    background-color: #ff9d00;
}

.payment-badge {
    background-color: #0087b0;
}

@media (max-width: 768px) {
.billing-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
    box-sizing: border-box; /* Include padding in the element's total width and height */
}

.billing-card {
    margin-left: 0;
    width: 100%;
}
}
</style>

  