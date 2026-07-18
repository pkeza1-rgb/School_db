CREATE DATABASE IF NOT EXISTS alu_db;
USE alu_db;

-- =========================================
-- MEMBER B: Classroom Table
-- =========================================
CREATE TABLE IF NOT EXISTS Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

INSERT INTO Classroom (room_number, building, capacity) VALUES 
('Room 101', 'MH1', 30),
('Room 102', 'MH2', 25);
-- Additional Classroom rows to meet 5-row minimum (added by Rebecca)
INSERT INTO Classroom (room_number, building, capacity) VALUES
('Room 201', 'MH2', 40),
('Lab A', 'Science Block', 20),
('Aud Max', 'Main Campus', 150);

-- Member B Operations
UPDATE Classroom SET capacity = 35 WHERE room_number = 'Room 102';
DELETE FROM Classroom WHERE room_number = 'Room 301';
SELECT * FROM Classroom WHERE capacity >= 25;

-- ==========================================
-- MEMBER A: Students Table
-- ==========================================
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    classroom_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
('Alice Iradukunda', 'a.iradukunda@alustudent.com', 1, '2025-09-01'),
('Bob Mugisha', 'b.mugisha@alustudent.com', 1, '2025-09-01'),
('Chloe Keza', 'c.keza@alustudent.com', 2, '2026-01-15'),
('David Nshuti', 'd.nshuti@alustudent.com', 2, '2026-01-15'),
('Eva Umuhoza', 'e.umuhoza@alustudent.com', 1, '2026-05-10');

UPDATE Students 
SET email = 'chloe.keza26@alustudent.com' 
WHERE student_id = 3;

DELETE FROM Students 
WHERE student_id = 5;

SELECT student_id, name, email, classroom_id 
FROM Students 
WHERE classroom_id = 1;

-- ============================================================
-- MEMBER C: Faculty Table
-- ============================================================
CREATE TABLE IF NOT EXISTS Faculty (
    faculty_id    INT           NOT NULL AUTO_INCREMENT,
    first_name    VARCHAR(50)   NOT NULL,
    last_name     VARCHAR(50)   NOT NULL,
    email         VARCHAR(100)  NOT NULL UNIQUE,
    phone         VARCHAR(20),
    department    VARCHAR(100)  NOT NULL,
    hire_date     DATE          NOT NULL,
    PRIMARY KEY (faculty_id)
);

INSERT INTO Faculty (first_name, last_name, email, phone, department, hire_date) VALUES
('Alice',   'Mugisha',    'a.mugisha@alu.edu',   '+250780001001', 'Computer Science', '2018-08-01'),
('Bernard', 'Nkurunziza', 'b.nkuru@alu.edu',    '+250780001002', 'Mathematics',      '2019-01-15'),
('Claire',  'Uwase',      'c.uwase@alu.edu',     '+250780001003', 'Business',         '2020-03-10'),
('David',   'Habimana',   'd.habimana@alu.edu',  '+250780001004', 'Engineering',      '2017-06-22'),
('Esther',  'Ingabire',   'e.ingabire@alu.edu',  '+250780001005', 'Liberal Arts',     '2021-09-01');

UPDATE Faculty SET department = 'Entrepreneurship' WHERE faculty_id = 3;
DELETE FROM Faculty WHERE faculty_id = 5;
SELECT faculty_id, first_name, last_name, email, hire_date FROM Faculty WHERE department = 'Computer Science';

-- ============================================================
-- MEMBER D: Courses Table
-- ============================================================

CREATE TABLE Courses (
    course_id     INT NOT NULL AUTO_INCREMENT,
    course_name   VARCHAR(100) NOT NULL,
    credits       INT NOT NULL,
    faculty_id    INT NOT NULL,
    classroom_id  INT NOT NULL,
    PRIMARY KEY (course_id),
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
('Introduction to Databases',        3, 1, 1),
('Data Structures and Algorithms',   4, 1, 2),
('Software Engineering Principles',  3, 2, 1),
('Ethics in Technology',             2, 3, 2),
('Entrepreneurship in Tech',         3, 4, 1);

UPDATE Courses SET credits = 3 WHERE course_name = 'Ethics in Technology';

DELETE FROM Courses WHERE course_name = 'Entrepreneurship in Tech';

SELECT course_id, course_name, credits, faculty_id, classroom_id
FROM Courses
WHERE credits = 3;

-- ============================================================
-- MEMBER E: Extra_Curricular_Activities Table
-- ============================================================
CREATE TABLE IF NOT EXISTS Extra_Curricular_Activities (
    activity_id INT NOT NULL AUTO_INCREMENT,
    activity_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    faculty_advisor_id INT NOT NULL,
    PRIMARY KEY (activity_id),
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
('Football Club', 'Sports', 1),
('Coding Club', 'Technology', 2),
('Debate Club', 'Academic', 3),
('Music Club', 'Arts', 4),
('Volleyball Club', 'Sports', 1);

UPDATE Extra_Curricular_Activities SET category = 'STEM' WHERE activity_id = 2;
DELETE FROM Extra_Curricular_Activities WHERE activity_id = 5;
SELECT activity_id, activity_name, category FROM Extra_Curricular_Activities WHERE category = 'Sports'; 
 -- ============================================================
-- MEMBER E: Junction Tables (Student_Courses, Student_Activities)
-- ============================================================

CREATE TABLE Student_Courses (
    student_id INT NOT NULL,
    course_id  INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Student_Courses (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4);
CREATE TABLE Student_Activities (
    student_id INT NOT NULL,
    activity_id INT NOT NULL,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);
INSERT INTO Student_Activities (student_id, activity_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 2);
-- ============================================================
-- MEMBER E: Advanced Queries (JOIN and Aggregate Queries)
-- ============================================================

-- JOIN Query 1: Display students with their classroom information
SELECT 
    Students.student_id,
    Students.name,
    Students.email,
    Classroom.room_number,
    Classroom.building,
    Classroom.capacity
FROM Students
JOIN Classroom 
ON Students.classroom_id = Classroom.classroom_id;


-- JOIN Query 2: Display students and the courses they are enrolled in
SELECT
    Students.name AS student_name,
    Courses.course_name,
    Courses.credits
FROM Students
JOIN Student_Courses
ON Students.student_id = Student_Courses.student_id
JOIN Courses
ON Student_Courses.course_id = Courses.course_id;


-- Aggregate Query: Count the number of students in each classroom
SELECT
    Classroom.room_number,
    Classroom.building,
    COUNT(Students.student_id) AS total_students
FROM Classroom
LEFT JOIN Students
ON Classroom.classroom_id = Students.classroom_id
GROUP BY Classroom.classroom_id;
-- ============================================================
-- GROUP TASK: Normalization Discussion
-- ============================================================
/*
Our schema avoids repeating data by referencing related records through 
foreign keys instead of duplicating their details. Courses stores only 
faculty_id and classroom_id instead of repeating faculty names or room 
information in Faculty and Classroom. 
Extra_Curricular_Activities does the same with faculty_advisor_id. The 
many-to-many relationships between students and courses, and students 
and activities, are handled through dedicated junction tables 
(Student_Courses, Student_Activities) rather than storing repeating 
lists inside Students or Courses every enrollment or participation is 
stored as a single row pairing two IDs, with no duplicated student, 
course, or activity data.
*/
