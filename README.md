# ALU Database Management System

## Overview

This project is a relational database system designed for **African Leadership University (ALU)** to manage academic information. The database stores and manages information about students, classrooms, faculty members, courses, and extracurricular activities.

The database was developed collaboratively by group members, with each member responsible for designing and implementing specific tables and operations as the individual commits highlight.

## Database Name
We decided to name the database "alu_db".

## Technologies Used

- MySQL
- Aiven Cloud Database
- VS Code( with the help of database client extension)
- Github and github extension in VS Code

## Database Structure

The database contains the following tables:

### 1. Classroom Table (Member B) by Adukwu Oche

Stores information about classrooms available at ALU.

**Attributes:**
- `classroom_id` - Unique classroom identifier
- `room_number` - Classroom number
- `building` - Building name
- `capacity` - Number of students the room can accommodate

**Operations performed:**
- Insert classroom records
- Update classroom capacity
- Delete classroom records
- Retrieve classrooms based on capacity

---

### 2. Students Table (Member A) by Kethia Keza

Stores student information and their classroom assignments.

**Attributes:**
- `student_id` - Unique student identifier
- `name` - Student full name
- `email` - Student email address
- `classroom_id` - Assigned classroom
- `enrollment_date` - Date of enrollment

**Relationships:**
- Each student belongs to a classroom.

**Operations performed:**
- Add student records
- Update student information
- Delete student records
- Retrieve students by classroom

### 3. Faculty Table (Member C) by Bemnet Tenketem

Stores information about ALU faculty members.

**Attributes:**
- `faculty_id` - Unique faculty identifier
- `first_name` - Faculty first name
- `last_name` - Faculty last name
- `email` - Faculty email
- `phone` - Contact number
- `department` - Faculty department
- `hire_date` - Employment date

**Operations performed:**
- Insert faculty records
- Update faculty departments
- Delete faculty records
- Search faculty by department

### 4. Courses Table (Member D) by Rebecca Isaboke

Stores information about academic courses offered at ALU.

**Attributes:**
- `course_id` - Unique course identifier
- `course_name` - Name of the course
- `credits` - Course credit value
- `faculty_id` - Faculty member teaching the course
- `classroom_id` - Classroom where the course is conducted

**Relationships:**
- Courses are linked to faculty members.
- Courses are assigned to classrooms.

**Operations performed:**
- Add courses
- Update course details
- Delete courses
- Retrieve courses based on credits

### 5. Extra_Curricular_Activities Table by Aldo Rudakemwa

Stores information about student activities and clubs.

**Attributes:**
- `activity_id` - Unique activity identifier
- `activity_name` - Name of activity
- `category` - Activity category
- `faculty_advisor_id` - Faculty supervisor

**Relationships:**
- Each activity has a faculty advisor.

**Operations performed:**
- Add activities
- Update activity categories
- Delete activities
- Retrieve activities by category

### 6. Student_Courses Junction Table by Paradis Keza

Creates a many-to-many relationship between students and courses.

**Attributes:**
- `student_id`
- `course_id`

A student can enroll in multiple courses, and each course can have multiple students.

### 7. Student_Activities Junction Table by Paradis Keza

Creates a many-to-many relationship between students and extracurricular activities.

**Attributes:**
- `student_id`
- `activity_id`

Students can participate in multiple activities, and activities can have multiple students.

---

- ## Team members and their roles
## Team Members and Roles

| Member | Responsibility |
|---|---|
| Kethia Keza (Member A) | Designed and implemented the Students table, including CREATE, INSERT, UPDATE, DELETE, and SELECT operations. |
| Adukwu Oche (Member B) | Designed and implemented the Classroom table, including classroom records and classroom operations. |
| Bemnet Tenketem (Member C) | Designed and implemented the Faculty table, including CREATE, INSERT, UPDATE, DELETE, and SELECT operations. |
| Rebecca Isaboke (Member D) | Designed and implemented the Courses table, verified foreign key relationships, contributed JOIN Query 3, and wrote the normalization discussion. |
| Aldo Rudakemwa (Member E) | Designed and implemented the Extra_Curricular_Activities table. |
| Paradis Keza (Member E) | Implemented junction tables (Student_Courses and Student_Activities), JOIN Queries 1–2, Aggregate Query, and README documentation. |
