--Encuentre el dept, title de los instructores registrados en la base de datos.

SELECT dept, title FROM instructor;

-- Indique el nombre y programa del estudiante con student_id = 7656

SELECT name, program FROM student WHERE student_id = 7656;

-- Encuentre los nombres de todos los estudiantes que se han matriculado en el curso con course_id = 837873

SELECT name FROM enrols NATURAL JOIN student WHERE course_id = 837873;

--Cree una vista llamada better_students que presente los estudiantes que obtuvieron las notas más altas por cada semestre entre los años 1900 y 2018

CREATE VIEW better_students AS
    SELECT R1.student_id, name,R2.grade,R2.semester,R2.year FROM
        (SELECT student_id, name, grade, semester, year FROM student NATURAL JOIN enrols) AS R1 RIGHT JOIN
        (SELECT max(grade) AS "grade",semester,year FROM enrols
        NATURAL JOIN student
        GROUP BY semester,year
        HAVING year >= 1900 AND year <=2018) AS R2 
        ON R1.grade = R2.grade AND R1.semester = R2.semester AND R1.year = R2.year ORDER BY R2.year DESC, R2.semester DESC;


