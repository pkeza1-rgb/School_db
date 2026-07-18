-- ============================================================
-- ALU School Database
-- ============================================================

USE alu_db;

-- ============================================================
-- MEMBER C: Faculty Table
-- ============================================================

CREATE TABLE Faculty (
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

-- UPDATE: change Claire's department
UPDATE Faculty
SET department = 'Entrepreneurship'
WHERE faculty_id = 3;

-- DELETE: remove Esther
DELETE FROM Faculty
WHERE faculty_id = 5;

-- SELECT with WHERE: find all faculty in Computer Science
SELECT faculty_id, first_name, last_name, email, hire_date
FROM Faculty
WHERE department = 'Computer Science';
