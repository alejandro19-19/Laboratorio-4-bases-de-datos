CREATE DATABASE lab4
    WITH
    OWNER = postgres    
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE template0;
\c lab4

-- secuencia para student_id
CREATE SEQUENCE student_numeration
INCREMENT 168
START 7488;

-- secuencia para course_id

CREATE SEQUENCE course_numeration
INCREMENT 23
START 837827;

-- Dominios propios

CREATE DOMAIN DT_grade AS NUMERIC(3,2)
CONSTRAINT grade_range
    CHECK (VALUE >= 1.00 AND VALUE <= 5.00);

CREATE DOMAIN anho AS INTEGER
CONSTRAINT anho_range
CHECK(
    VALUE >=1900);

-- relacion student 

CREATE TABLE student(
    student_id INT DEFAULT NEXTVAL('student_numeration'),
    name VARCHAR(50) NOT NULL,
    program VARCHAR(50) NOT NULL,
    PRIMARY KEY(student_id)
);

-- relacion course

CREATE TABLE course (
    course_id INT DEFAULT NEXTVAL('course_numeration'),
    title VARCHAR(50) NOT NULL,
    syllabus VARCHAR(250) NOT NULL,
    credits INT NOT NULL,
    PRIMARY KEY (course_id)
);

-- relacion instructor

CREATE TABLE instructor(
    instructor_id SERIAL,
    name VARCHAR(50) NOT NULL,
    dept VARCHAR (50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (instructor_id)
);

-- relacion course_offering

CREATE TABLE course_offering(
    course_id INT NOT NULL,
    sec_id SERIAL,
    year anho,
    semester VARCHAR(2),
    time INT NOT NULL,
    classroom VARCHAR(50) NOT NULL,
    PRIMARY KEY (course_id,sec_id,year,semester),
    CONSTRAINT fk_course_offering
        FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- relacion enrols
CREATE TABLE enrols(
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    sec_id SERIAL,
    semester VARCHAR(2),
    year anho,
    grade DT_grade NOT NULL,
    PRIMARY KEY (student_id,course_id,sec_id,year,semester),
    CONSTRAINT fk_student_id_enrols
        FOREIGN KEY (student_id) REFERENCES student(student_id),
    CONSTRAINT fk_course_id_enrols
        FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- relacion teaches

CREATE TABLE teaches(
    course_id INT NOT NULL,
    sec_id SERIAL,
    semester VARCHAR(2),
    year anho,
    instructor_id INT NOT NULL,
    PRIMARY KEY (course_id, sec_id, semester,year,instructor_id),
    CONSTRAINT fk_course_id_teaches
        FOREIGN KEY (course_id) REFERENCES course(course_id),
    CONSTRAINT fk_instructor_id_teaches
        FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

-- relacion requires
CREATE TABLE requires(
    main_course INT NOT NULL,
    prerequisite INT NOT NULL,
    PRIMARY KEY (main_course, prerequisite),
    CONSTRAINT fk_main_course_requires
        FOREIGN KEY (main_course) REFERENCES course(course_id),
    CONSTRAINT fk_prerequisite_requires
        FOREIGN KEY (prerequisite) REFERENCES course(course_id)
);
