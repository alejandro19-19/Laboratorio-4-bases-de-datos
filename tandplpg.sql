--Cree uno o varios disparadores (triggers) que implemente los siguiente requerimientos para la relación enrolls 

-- i.
--Al agregar una tupla en enrolls, en caso de que la nota sea negativa, cero (0.0) o mayor de 5.00 
--se debe generar una excepción indicando que el valor a guardar en grade es incorrecto o invalido.

CREATE OR REPLACE FUNCTION grade_checker_func()
RETURNS TRIGGER AS $grade_checker_func$
DECLARE
    BEGIN
        IF NEW.grade <= 0 OR NEW.grade > 5 THEN
            BEGIN
               RAISE EXCEPTION 'La nota que se intentó ingresar no es valida';
           END;
       END IF;
        RETURN NEW;
    END;
$grade_checker_func$ LANGUAGE plpgsql;

CREATE TRIGGER grade_checker
BEFORE INSERT ON enrols 
FOR EACH ROW EXECUTE PROCEDURE grade_checker_func();

-- ii.
--Durante la actualización de un registro si el valor grade es modificado, usando RAISE NOTICE se debe presentar 
--un mensaje indicando el cambio, si es igual al valor grade en la tabla se debe indicar que el valor no ha sido 
--modificado. Si el grade a actualizar es negativo, cero o mayor de cinco use RAISE EXCEPTION.

CREATE OR REPLACE FUNCTION grade_update_checker_func()
RETURNS TRIGGER AS $grade_update_checker_func$
DECLARE
    BEGIN
        IF NEW.grade <= 0 OR NEW.grade > 5 THEN
            BEGIN
               RAISE EXCEPTION 'La nota que se intentó ingresar no es valida';
            END;
        ELSE 
            IF NEW.grade = OLD.grade THEN
                RAISE NOTICE 'La nueva nota ingresada es igual a la existente';
                RETURN NEW;
            ELSE
                RAISE NOTICE 'El valor de la nota a cambiado a: %', NEW.grade;
                RETURN NEW;
            END IF;
        END IF;
    END;
$grade_update_checker_func$ LANGUAGE plpgsql;

CREATE TRIGGER grade_update_checker
BEFORE UPDATE ON enrols 
FOR EACH ROW EXECUTE PROCEDURE grade_update_checker_func() ;

--Cree un procedimiento create_teaches que automáticamente agregue un registro a teaches. 
--Este recibe dos argumentos un identificador de instructor instructor_id y un identificador 
--de course_id. Se asume que ambos existen en la base de datos. 
--Este procedimiento debe verificar que el curso exista en la oferta de cursos.
--Use curse_id, sec_id, year y semester de la oferta de curso y instructor_id el para insertar en teaches.

CREATE OR REPLACE PROCEDURE create_teaches(instruct_id INT, curso_id INT)

LANGUAGE plpgsql AS $$
BEGIN 
    IF EXISTS(SELECT course_id FROM course_offering WHERE course_id = curso_id) THEN
       INSERT INTO teaches (course_id, sec_id, semester, year, instructor_id) 
       SELECT course_id, sec_id,  semester,year, instruct_id instructor_id FROM course_offering WHERE course_id = curso_id;
    ELSE
        RAISE EXCEPTION 'No existe el identificador que se esta intentando agregar';
    END IF;
END;
$$;
       