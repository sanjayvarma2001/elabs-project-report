/*Creating a Database and using it implement schema*/
CREATE DATABASE studentgradesys;

USE studentgradesys;
/*Implementing the multiple schemas which are interconnected*/
CREATE TABLE students(
	student_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT NOT NULL,
    admission_year INT);

CREATE TABLE courses(
	course_id INT PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits INT);
    
CREATE TABLE semesters(
	semester INT PRIMARY KEY,
    year INT NOT NULL,
    session VARCHAR(20));
    
CREATE TABLE grades(
	student_id INT,
    course_id INT,
    semester INT,
    grade CHAR(2),
    PRIMARY KEY (student_id,course_id,semester),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (semester) REFERENCES semesters(semester)
);

CREATE TABLE grades_points(
	grade CHAR(2) NOT NULL,
    points INT NOT NULL);
    
CREATE TABLE semester_gpa(
	student_id INT,
    semester INT,
    total_credits INT,
    sgpa DECIMAL(4,2),
    PRIMARY KEY (student_id,semester),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (semester) REFERENCES semesters(semester));

ALTER TABLE Students ADD COLUMN cgpa DECIMAL(4,2) DEFAULT 0.00;

DELIMITER $$
CREATE PROCEDURE update_cgpa(student INT)
BEGIN
	DECLARE new_cgpa DECIMAL(4,2);
    
    SELECT ROUND(SUM(sgpa * total_credits) / SUM(total_credits), 2)
    INTO new_cgpa
    FROM semester_gpa
    WHERE student_id = student;
    
    UPDATE students
    SET cgpa = new_cgpa
    WHERE student_id = student;
END$$
DELIMITER ;

INSERT INTO Students VALUES (1, 'A-1', 'CS', 2022);
INSERT INTO Courses VALUES (101, 'DBMS', 4), (102, 'OS', 3);
INSERT INTO Semesters VALUES (1, 2022, 'Spring');

INSERT INTO grades_points VALUES
('A', 10), ('B', 8), ('C', 6), ('D', 4), ('F', 0);

INSERT INTO Grades VALUES (1, 101, 1, 'A'), (1, 102, 1, 'B');

SELECT * FROM students;
SELECT * FROM semester_gpa;
SELECT * FROM grades;
SELECT * FROM grades_points;


DESCRIBE students;