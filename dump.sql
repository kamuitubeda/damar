-- Table: users
CREATE TABLE users (
  id UUID PRIMARY KEY,
  name VARCHAR NOT NULL,
  email VARCHAR UNIQUE NOT NULL,
  password VARCHAR NOT NULL,
  role VARCHAR CHECK (role IN ('admin', 'kepala_sekolah', 'guru', 'orang_tua', 'siswa')) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: schools
CREATE TABLE schools (
  id UUID PRIMARY KEY,
  name VARCHAR NOT NULL,
  address VARCHAR,
  phone VARCHAR,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: dormitories
CREATE TABLE dormitories (
  id UUID PRIMARY KEY,
  name VARCHAR NOT NULL,
  location VARCHAR,
  capacity INT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: students
CREATE TABLE students (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  school_id UUID REFERENCES schools(id),
  dormitory_id UUID REFERENCES dormitories(id),
  grade VARCHAR,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: announcements
CREATE TABLE announcements (
  id UUID PRIMARY KEY,
  title VARCHAR NOT NULL,
  content TEXT NOT NULL,
  school_id UUID REFERENCES schools(id),
  dormitory_id UUID REFERENCES dormitories(id),
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE events (
  id UUID PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT,
  event_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE event_registrations (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  event_id UUID REFERENCES events(id),
  registration_date DATE NOT NULL DEFAULT NOW(),
  status VARCHAR NOT NULL CHECK (status IN ('registered', 'cancelled')),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE attendances (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  date DATE NOT NULL,
  status VARCHAR NOT NULL CHECK (status IN ('present', 'absent', 'late', 'excused')),
  event_id UUID REFERENCES events(id), -- Optional, if attendance is for specific events
  remarks TEXT, -- Column for additional comments or notes
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE scholarships (
  id UUID PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT,
  percentage_discount DECIMAL NOT NULL CHECK (percentage_discount >= 0 AND percentage_discount <= 100),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE student_scholarships (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  scholarship_id UUID REFERENCES scholarships(id),
  granted_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE bills (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  original_amount DECIMAL NOT NULL,
  discount_amount DECIMAL NOT NULL,
  final_amount DECIMAL NOT NULL,
  due_date DATE NOT NULL,
  description VARCHAR,
  is_monthly BOOLEAN NOT NULL,
  event_id UUID REFERENCES events(id), -- Jika menggunakan event
  status VARCHAR NOT NULL CHECK (status IN ('unpaid', 'partially_paid', 'paid')) DEFAULT 'unpaid',
  paid_amount DECIMAL NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payments (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  bill_id UUID REFERENCES bills(id),
  amount DECIMAL NOT NULL,
  payment_date DATE NOT NULL,
  payment_type VARCHAR CHECK (payment_type IN ('school', 'dormitory', 'event', 'bill')) NOT NULL,
  description VARCHAR,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE achievements (
  id UUID PRIMARY KEY,
  student_id UUID REFERENCES students(id),
  title VARCHAR NOT NULL, -- Nama prestasi atau penghargaan
  description TEXT, -- Deskripsi prestasi
  date DATE NOT NULL, -- Tanggal prestasi
  level VARCHAR NOT NULL CHECK (level IN ('school', 'district', 'national', 'international')), -- Tingkat prestasi
  remarks TEXT, -- Catatan tambahan
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);