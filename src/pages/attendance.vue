<template>
  <f7-page name="absensi">
    <f7-navbar title="Absensi" back-link="Back"></f7-navbar>
    <div class="attendance-page">
      <div class="attendance-search">
        <f7-input
          type="search"
          placeholder="Cari siswa..."
          v-model="searchQuery"
          @input="filterStudents"
          class="search-input"
        />
      </div>

      <div class="attendance-filters">
        <f7-list>
          <f7-list-item title="Pilih kelas" smart-select>
            <select v-model="selectedClass" @change="filterStudentsByClass">
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

      <div class="attendance-list">
        <f7-card
          v-for="(student, index) in filteredStudents"
          :key="index"
          class="attendance-card"
        >
          <div class="attendance-card-content">
            <div class="student-info">
              <div class="student-name">{{ student.name }}</div>
              <div class="student-class" v-if="student.class">
                <span class="class-label">Kelas:</span> {{ student.class }}
              </div>
            </div>
            <div class="attendance-status">
              <f7-button
                fill
                small
                color="green"
                @click="setAttendanceStatus(student, 'hadir')"
                class="attendance-button"
              >
                <span class="button-label">Hadir</span>
                <i class="icon material-icons" style="color: white;">check</i>
              </f7-button>
              <f7-button
                fill
                small
                color="blue"
                @click="setAttendanceStatus(student, 'izin')"
                class="attendance-button"
              >
                <span class="button-label">Izin</span>
                <i class="icon material-icons" style="color: white;">help</i>
              </f7-button>
              <f7-button
                fill
                small
                color="red"
                @click="setAttendanceStatus(student, 'absen')"
                class="attendance-button"
              >
                <span class="button-label">Absen</span>
                <i class="icon material-icons" style="color: white;">close</i>
              </f7-button>
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
      selectedClass: '',
      classOptions: [
        { text: 'Gryffindor - Year 1', value: 'gryffindor-year-1' },
        { text: 'Slytherin - Year 2', value: 'slytherin-year-2' },
        // Tambahkan kelas lainnya di sini
      ],
      students: [
        { name: 'Harry Potter', class: 'gryffindor-year-1', status: 'hadir' },
        { name: 'Hermione Granger', class: 'gryffindor-year-1', status: 'hadir' },
        { name: 'Draco Malfoy', class: 'slytherin-year-2', status: 'hadir' },
        // Tambahkan siswa lainnya di sini
      ],
      filteredStudents: []
    };
  },
  methods: {
    filterStudents() {
      const query = this.searchQuery.toLowerCase();
      this.filteredStudents = this.students.filter(student =>
        student.name.toLowerCase().includes(query)
      );
    },
    filterStudentsByClass() {
      if (this.selectedClass) {
        this.filteredStudents = this.students.filter(
          student => student.class === this.selectedClass
        );
      } else {
        this.filteredStudents = this.students;
      }
    },
    setAttendanceStatus(student, status) {
      student.status = status;
    }
  },
  created() {
    this.filteredStudents = this.students;
  }
};
</script>

<style scoped>
.attendance-page {
  padding: 20px;
  background-color: #f8f9fa; /* Warna latar belakang yang netral */
}

.attendance-search {
  display: flex;
  margin-bottom: 20px;
}

.search-input {
  flex: 1;
  padding: 15px;
  border-radius: 8px;
  border: 1px solid #ddd;
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

.attendance-filters {
  margin-bottom: 20px;
}

.attendance-list {
  display: flex;
  flex-wrap: wrap;
  gap: 5px;
  justify-content: center;
}

.attendance-card {
  width: calc(33.333% - 20px); /* Lebar kartu responsif */
  min-width: 300px; /* Lebar kartu minimum */
  box-sizing: border-box;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s, box-shadow 0.3s;
}

.attendance-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.attendance-card-content {
  padding: 20px;
}

.student-info {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.student-name {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 5px;
}

.student-class {
  font-size: 14px;
  color: #666;
}

.attendance-status {
  display: flex;
  justify-content: flex-end;
  margin-top: 15px;
  gap: 5px;
}

.attendance-status f7-button {
  flex: 1;
  margin-right: 5px;
  padding: 10px 15px;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.attendance-status f7-button:hover {
  background-color: slightly lighter;
}

.attendance-status f7-button:last-child {
  margin-right: 0;
}

/* Warna tombol status berdasarkan status kehadiran */
.attendance-status f7-button[color="green"] {
  background-color: #4CAF50;
}

.attendance-status f7-button[color="blue"] {
  background-color: #2196F3;
}

.attendance-status f7-button[color="red"] {
  background-color: #F44336;
}

.material-icons {
  color: white;
  font-size: 0.8em;
}

@media (max-width: 768px) {
  .attendance-card {
    width: calc(100% - 20px);
  }
}
</style>


<!-- <template>
  <f7-page name="attendance" >
    <f7-navbar title="Calendar" back-link="Back"></f7-navbar>

    <f7-block>
      <p>Calendar is a touch optimized component that provides an easy way to handle dates.</p>
      <p>
        Calendar could be used as inline component or as overlay. Overlay Calendar will be
        automatically converted to Popover on tablets (iPad).
      </p>
    </f7-block>

    <f7-block-title>Default setup</f7-block-title>
    <f7-list strong-ios outline-ios>
      <f7-list-input type="datepicker" placeholder="Pilih hari" readonly />
    </f7-list>
  </f7-page>
</template> -->