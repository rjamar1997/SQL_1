--Created table
Create DATABASE Student_miniproject

CREATE TABLE Student_miniproject 
(  student_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  date_of_birth DATE,
  email VARCHAR(100),
  major VARCHAR(50));

--Created Database Courses
Create Database Courses

CREATE TABLE Courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100),
  credit_hours INT,
  instructor VARCHAR(100)
);

--Retrieve the list of students who are majoring in a specific major (e.g., Computer Science).

INSERT INTO Student_miniproject (student_id, student_name, date_of_birth, email, major)
VALUES (1, 'John Doe', '1998-07-15', 'john.doe@example.com', 'Computer Science')

INSERT INTO Student_miniproject (student_id, student_name, date_of_birth, email, major)
VALUES
 (2, 'Jane Smith', '1999-03-22', 'jane.smith@example.com', 'Mathematics'),
  (3, 'Michael Johnson', '2000-11-08', 'michael.johnson@example.com', 'Computer Science'),
  (4, 'Emily Williams', '2001-05-01', 'emily.williams@example.com', 'Physics')

--Retrieve the list of courses taught by a specific instructor.

INSERT INTO Courses (course_id, course_name, credit_hours, instructor)
VALUES
  (101, 'Database Management', 3, 'Prof. Brown'),
  (102, 'Programming Fundamentals', 4, 'Prof. White'),
  (103, 'Calculus I', 4, 'Prof. Smith'),
  (104, 'Physics I', 4, 'Prof. Johnson');

--Retrieve the list of students who are majoring in a specific major (e.g., Computer Science)
SELECT * FROM Student_miniproject WHERE major = 'Computer Science';

--Retrieve the list of students who were born before a specific date
SELECT * FROM Student_miniproject WHERE date_of_birth < '2000-01-01'

--Retrieve the list of courses taught by a specific instructor.
SELECT * FROM Courses WHERE instructor = 'Prof. Smith'
SELECT * FROM Courses WHERE instructor = 'Prof. White'

--Retrieve the total number of students enrolled in each major
SELECT major, COUNT(*) AS total_students FROM Student_miniproject GROUP BY major

--Retrieve the course with the highest number of credit hours
SELECT * FROM Courses ORDER BY credit_hours DESC LIMIT 1

--Retrieve the oldest and youngest students in the database.
SELECT * FROM Student_miniproject ORDER BY date_of_birth ASC LIMIT 1 -- Oldest student
SELECT * FROM Student_miniproject ORDER BY date_of_birth DESC LIMIT 1 -- Youngest student

--Write SQL queries to update the database
--Add a new course to the Courses table
Select * from Courses
INSERT INTO Courses 
(course_id, course_name, credit_hours, instructor)
VALUES (105, 'Maths', 5, 'Prof. Brown')

-- Enroll a new student in the Students table.
Select * from Student_miniproject
INSERT INTO Student_miniproject
(student_id, student_name, date_of_birth, email, major)
VALUES (5, 'William Johnson', '2002-09-12', 'william.johnson@example.com', 'Computer Science')

--Update the email address of a student based on their student_id.

UPDATE Student_miniproject SET email = 'jane.smith@gmail.com' WHERE student_id = 2


--Write SQL queries with nested queries:
--Retrieve the list of students who are enrolled in a specific course
SELECT * FROM Courses
SELECT * FROM Student_miniproject WHERE student_id IN 
(SELECT student_id FROM Enrollments WHERE course_id = 101);

Create Database Enrollments
use enrollments
CREATE TABLE Enrollments
(Entrollmentid INT PRIMARY KEY,
  Entrollmentsdetails VARCHAR(100),
  Student_ID VARCHAR(100),
  course_ID VARCHAR(100));

INSERT INTO Enrollments (Entrollmentid, student_id, Entrollmentsdetails, course_ID)
Values ('1234', 1, 'Yes', 101),
('1235', 2, 'Yes', 102),
('1236', 3, 'Yes', 103)

SELECT * FROM Courses WHERE course_id IN 
(SELECT course_id FROM Enrollments GROUP BY course_id HAVING COUNT(*) > 2);