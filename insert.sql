--Informacion ingresada a la relacion student
INSERT INTO student (name,program) VALUES
('Juan','Ingenieria De Sistemas'),
('Camilo','Ingenieria De Sistemas'),
('Alejandro','Filosofia'),
('Diego','Quimica'),
('Miguel','Estadistica'),
('David','Ingenieria De Sistemas'),
('Mauricio','Quimica'),
('Jeffer','Filosofia');

--Informacion ingresada a la relacion course
INSERT INTO course (title, syllabus, credits) VALUES
('Calculo', 'curso con 3 quices', 4),
('Fisica', 'curso sin opcionales', 3),
('Discretas', 'curso con gran proyecto', 5),
('TGS', 'curso con vensim', 3),
('Bases de datos', 'curso con 6 quices', 4),
('Redes', 'curso de cisco', 6),
('Ingles', 'verbo to be', 2),
('Algebra', 'curso con un gran opcional', 7);

--Informacion ingresada a la relacion instructor
INSERT INTO instructor (name, dept, title) VALUES
('Martha', 'Matematicas', 'Doctorado en matematicas'),
('Robinson', 'Fisica', 'Doctorado en fisica'),
('Oscar', 'Ingenieria De Sistemas', 'Doctorado en ciencias de la computacion'),
('Ruben', 'Ambiental', 'Doctorado en gestion ambiental'),
('Leoviviana', 'Ingenieria De Sistemas', 'Doctorado en ciencias de la computacion'),
('Laura', 'Ingenieria De Sistemas', 'Doctorado en Telecomunicaciones'),
('Andres', 'Lenguas', 'Doctorado en Linguistica'),
('Elias', 'Matematicas', 'Doctorado en ciencias matematicas');

--Informacion ingresada a la relacion course_offering
INSERT INTO course_offering(course_id,year,semester,time,classroom) VALUES
(837827, 2018,'02',3,'AUD 1'),
(837850, 2020,'03',2,'AUD 3'),
(837873, 2021,'02',4,'Sala 5'),
(837896, 2019,'06',5,'Salon 1005'),
(837919, 2022,'05',4,'Sala 2'),
(837942, 2015,'04',3,'Salon 1003'),
(837965, 2016,'01',3,'Salon 1025'),
(837988, 2017,'04',5,'AUD 2');

--Informacion ingresada a la relacion enrols
INSERT INTO enrols (student_id, course_id, semester, year, grade) VALUES
(7488, 837827, '02', 2018, 5),
(7656, 837850, '03', 2020, 2),
(7824, 837873, '02', 2021, 5),
(7992, 837896, '06', 2019, 3),
(8160, 837919, '05', 2022, 4),
(8328, 837942, '04', 2015, 4.8),
(8496, 837965, '01', 2016, 1),
(8664, 837988, '04', 2017, 3.2);

--Informacion ingresada a la relacion teaches
INSERT INTO teaches (course_id,semester,year,instructor_id) VALUES
(837827,'02',2018,1),
(837850,'03',2020,2),
(837873,'02',2021,3),
(837896,'06',2019,4),
(837919,'05',2022,5),
(837942,'04',2015,6),
(837965,'01',2016,7),
(837988,'04',2017,8);

--Informacion ingresada a la relacion requires
INSERT INTO requires (main_course, prerequisite) VALUES
(837827, 837850),
(837873, 837896),
(837919, 837942),
(837965, 837988),
(837850, 837873),
(837865, 837896);
