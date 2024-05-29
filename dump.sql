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

-- Table: school_years
CREATE TABLE school_years (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  name VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: students
CREATE TABLE students (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR NOT NULL,
  birth_date DATE NOT NULL,
  user_id UUID REFERENCES users(id), -- ID pengguna yang terkait dengan siswa ini
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: schools
CREATE TABLE schools (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR NOT NULL,
  address TEXT,
  phone_number VARCHAR,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: classes
CREATE TABLE classes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR NOT NULL,
  level VARCHAR NOT NULL,
  room_number VARCHAR,
  school_id UUID REFERENCES schools(id),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: student_class
CREATE TABLE school_year_school (
  school_year_id UUID REFERENCES school_years(id),
  school_id UUID REFERENCES schools(id),
  PRIMARY KEY (school_year_id, school_id)
);

-- Table: student_class
CREATE TABLE student_class (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id UUID REFERENCES students(id),
  class_id UUID REFERENCES classes(id),
  school_year_id UUID REFERENCES school_years(id),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  CONSTRAINT unique_student_class_school_year UNIQUE (student_id, class_id, school_year_id)
);

-- Table: dormitories
CREATE TABLE dormitories (
  id UUID PRIMARY KEY gen_random_uuid(),
  name VARCHAR NOT NULL,
  location VARCHAR,
  capacity INT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE dormitory_residence (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id UUID REFERENCES students(id),
  dormitory_id UUID REFERENCES dormitories(id),
  start_date DATE NOT NULL,
  end_date DATE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table: announcements
CREATE TABLE announcements (
  id UUID PRIMARY KEY gen_random_uuid(),
  title VARCHAR NOT NULL,
  content TEXT NOT NULL,
  school_id UUID REFERENCES schools(id),
  dormitory_id UUID REFERENCES dormitories(id),
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE events (
  id UUID PRIMARY KEY gen_random_uuid(),
  name VARCHAR NOT NULL,
  description TEXT,
  event_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE event_registrations (
  id UUID PRIMARY KEY gen_random_uuid(),
  student_id UUID REFERENCES students(id),
  event_id UUID REFERENCES events(id),
  registration_date DATE NOT NULL DEFAULT NOW(),
  status VARCHAR NOT NULL CHECK (status IN ('registered', 'cancelled')),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE attendances (
  id UUID PRIMARY KEY gen_random_uuid(),
  student_id UUID REFERENCES students(id),
  date DATE NOT NULL,
  status VARCHAR NOT NULL CHECK (status IN ('present', 'absent', 'late', 'excused')),
  event_id UUID REFERENCES events(id), -- Optional, if attendance is for specific events
  remarks TEXT, -- Column for additional comments or notes
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE scholarships (
  id UUID PRIMARY KEY gen_random_uuid(),
  name VARCHAR NOT NULL,
  description TEXT,
  percentage_discount DECIMAL NOT NULL CHECK (percentage_discount >= 0 AND percentage_discount <= 100),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE student_scholarships (
  id UUID PRIMARY KEY gen_random_uuid(),
  student_id UUID REFERENCES students(id),
  scholarship_id UUID REFERENCES scholarships(id),
  granted_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE bills (
  id UUID PRIMARY KEY gen_random_uuid(),
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
  id UUID PRIMARY KEY gen_random_uuid(),
  student_id UUID REFERENCES students(id),
  bill_id UUID REFERENCES bills(id),
  amount DECIMAL NOT NULL,
  payment_date DATE NOT NULL,
  payment_type VARCHAR CHECK (payment_type IN ('school', 'dormitory', 'event', 'bill')) NOT NULL,
  description VARCHAR,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Menyisipkan data tahun pelajaran
INSERT INTO school_years (name, start_date, end_date)
VALUES 
    ('2023/2024', '2023-09-01', '2024-06-30'),
    ('2024/2025', '2024-09-01', '2025-06-30');

-- Menyisipkan data sekolah
INSERT INTO schools (name, address)
VALUES 
    ('Hogwarts School of Witchcraft and Wizardry', 'Hogsmeade, Scotland'),
    ('Beauxbatons Academy of Magic', 'Pyrénées, France'),
    ('Durmstrang Institute', 'Northern Europe');

-- Menyisipkan data kelas
INSERT INTO classes (school_id, name, level)
VALUES 
    ('8b7e9813-5c4f-4849-8aeb-f99d9f9005b6', 'Gryffindor', 'Year 1'),
    ('8b7e9813-5c4f-4849-8aeb-f99d9f9005b6', 'Slytherin', 'Year 2'),
    ('8b7e9813-5c4f-4849-8aeb-f99d9f9005b6', 'Hufflepuff', 'Year 3'),
    ('8b7e9813-5c4f-4849-8aeb-f99d9f9005b6', 'Ravenclaw', 'Year 4'),
    ('94d0ac87-8c70-4bd6-a5ef-c1050b389fbe', 'Beauxbatons', 'Year 1'),
    ('94d0ac87-8c70-4bd6-a5ef-c1050b389fbe', 'Beauxbatons', 'Year 2'),
    ('125e1749-25ae-426b-aa9d-486e453a839d', 'Durmstrang', 'Year 1'),
    ('125e1749-25ae-426b-aa9d-486e453a839d', 'Durmstrang', 'Year 2');

-- Menyisipkan data asrama
INSERT INTO dormitories (name, location)
VALUES 
    ('Gryffindor House', ''),
    ('Slytherin House', ''),
    ('Hufflepuff House', ''),
    ('Ravenclaw House', '');

-- Menyisipkan data siswa
INSERT INTO students (name, birth_date)
VALUES 
    ('Harry Potter', '1980-07-31'),
    ('Hermione Granger', '1979-09-19'),
    ('Ron Weasley', '1980-03-01'),
    ('Draco Malfoy', '1980-06-05'),
    ('Neville Longbottom', '1980-07-30'),
    ('Fleur Delacour', '1977-10-30'),
    ( 'Viktor Krum', '1976-04-22');

-- Menyisipkan data ke tabel student_class
INSERT INTO student_class (student_id, class_id, school_year_id)
VALUES 
    ('cbf02bdd-e766-4593-a4c0-c9d6f3afe7d9', '8346a052-e3cf-45e8-9421-b828ec5da918', '5af65f5e-5d60-47c1-9f0e-80db1a861609'), -- Harry Potter - Gryffindor Year 1
    ('9f7663c1-195d-4bb8-9a89-adbfd3d2ef27', '279397fd-143f-473a-b7fa-57b4bf6b4885', '5af65f5e-5d60-47c1-9f0e-80db1a861609'), -- Hermione Granger - Gryffindor Year 1
    ('376d9ce0-1fdd-4501-9b7d-83e00237785f', 'de4632b7-3bfa-4b29-a69f-d6f035ba6d4e', '5af65f5e-5d60-47c1-9f0e-80db1a861609'), -- Ron Weasley - Gryffindor Year 1
    ('8bc1390d-d454-4cb9-823b-6cbaaa4b9199', 'ae56a1aa-17f5-4c9e-a643-669438e651dd', '5af65f5e-5d60-47c1-9f0e-80db1a861609'), -- Draco Malfoy - Slytherin Year 2
    ('9130360a-cf37-448c-9788-00f23c18ac26', '1ea96063-0bfe-4ba4-8f45-47d25f08850d', '5af65f5e-5d60-47c1-9f0e-80db1a861609'), -- Neville Longbottom - Gryffindor Year 1
    ('92617d93-8aa7-4fd1-a227-5803b52a82d1', 'f3882440-dd07-42f2-ad0a-b267538c3d17', '5af65f5e-5d60-47c1-9f0e-80db1a861609'), -- Fleur Delacour - Beauxbatons Year 1
    ('1b7ccf25-619b-43b6-91c5-8911c715897f', 'e814d934-769c-47cc-ab6e-83f87c93ed79', '5af65f5e-5d60-47c1-9f0e-80db1a861609'); -- Viktor Krum - Durmstrang Year 1

