--Borrado de triggers
DROP TRIGGER grade_checker;
DROP TRIGGER grade_update_checker;

--Borrado de funciones
DROP FUNCTION grade_checker_func;
DROP FUNCTION grade_update_checker_func;

--Borrado de procedimientos
DROP PROCEDURE create_teaches;

--Borrado de vistas
DROP VIEW better_students;

--Borrado de Tablas
DROP TABLE course_offering;
DROP TABLE teaches;
DROP TABLE enrols;
DROP TABLE requires;
DROP TABLE student;
DROP TABLE course;
DROP TABLE instructor;

--Borrado de secuencias
DROP SEQUENCE student_numeration;
DROP SEQUENCE course_numeration;

--Borrado de dominios
DROP DOMAIN  DT_grade;
DROP DOMAIN anho;

