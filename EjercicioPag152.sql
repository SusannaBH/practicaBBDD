-- CREAR BBDD, USAR
CREATE DATABASE IF NOT EXISTS java_bcn_4;
USE java_bcn_4;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    NameStudent VARCHAR(50),
    AgeStudent INT,
    SexStudent VARCHAR(1)
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    NameTeacher VARCHAR(50)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    NameCourse VARCHAR(100),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
);

CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    Score DECIMAL(4, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Inserts para estudiantes
INSERT INTO Student (StudentID, NameStudent, AgeStudent, SexStudent) VALUES
(1, 'Juan Pérez', 20, 'M'),(2, 'María García', 22, 'F'),(3, 'Carlos Rodríguez', 21, 'M'),
(4, 'Ana López', 23, 'F'),(5, 'Pedro Martinez', 22, 'M'),(6, 'Sofía Torres', 21, 'F'),
(7, 'Javier González', 23, 'M'),(8, 'Laura Sánchez', 20, 'F'),(9, 'Miguel Jiménez', 24, 'M'),
(10, 'Elena Fernández', 21, 'F');

-- Inserts para profesores
INSERT INTO Teacher (TeacherID, NameTeacher) VALUES
(1, 'Profesor Smith'),(2, 'Profesora Johnson'),(3, 'Profesor Davis');

-- Inserts para cursos
INSERT INTO Course (CourseID, NameCourse, TeacherID) VALUES
(101, 'Bases de Datos', 1),(102, 'Programación', 2),(103, 'Lenguajes de Marcas', 3);

-- Inserts para la relación entre estudiantes y cursos
INSERT INTO StudentCourse (StudentID, CourseID, Score) VALUES 
(1, 101, 85.5), (1, 102, 92.0), (1, 103, 88.0),(2, 101, 78.0), (2, 102, 91.5), (2, 103, 85.0),
(3, 101, 79.5), (3, 102, 88.5), (3, 103, 89.5),(4, 101, 88.0), (4, 102, 91.0), (4, 103, 95.0),
(5, 101, 88.0), (5, 102, 92.0), (5, 103, 90.5),(6, 101, 81.5), (6, 102, 87.0), (6, 103, 82.5),
(7, 101, 90.0), (7, 102, 87.0), (7, 103, 93.5),(8, 101, 90.5), (8, 102, 87.5), (8, 103, 93.5),
(9, 101, 89.0), (9, 102, 85.0), (9, 103, 94.0),(10, 101, 86.5), (10, 102, 84.5), (10, 103, 91.0);

-- Muestra los alumnos a los que un profesor les da clase (Profesor con ID = 1)
SELECT S.StudentID, S.NameStudent FROM java_bcn_4.Student S
	JOIN StudentCourse SC ON S.StudentID = SC.StudentID
	JOIN Course C ON SC.CourseID = C.CourseID
	JOIN Teacher T ON C.TeacherID = T.TeacherID
WHERE T.TeacherID = 1;

-- Muestra el total de cursos que imparte el profesor (Profesor con ID = 2)
SELECT COUNT(*) AS Total_Course FROM Course WHERE TeacherID = 2;

-- Muestra el total de cursos que ha realizado el alumno (Alumno con ID = 5)
SELECT COUNT(*) AS TotalCursosRealizados FROM StudentCourse WHERE StudentID = 5;

-- Realiza una transaction con rollback sobre una de las tablas (Ejercicio Pag. 160)
	-- Inicia la transacción
START TRANSACTION;
	-- Realiza un cambio en la tabla Course
INSERT INTO Course (CourseID, NameCourse, TeacherID) VALUES (104, 'Desarrollo de Interfaces', 2);
	-- ROLLBACK, se puede deshacer si algo sale mal
ROLLBACK;

-- Realiza una transaction con commit sobre una de las tablas (Ejercicio Pag. 160)
	-- Inicia la transacción
	START TRANSACTION;
	-- Realiza cambios en la tabla Student 
	UPDATE Student SET AgeStudent = AgeStudent + 1 WHERE StudentID = 8;
	-- COMMIT para confirmar los cambios
	COMMIT;
