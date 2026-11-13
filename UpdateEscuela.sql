USE Escuela;

SELECT * FROM Profesores;

UPDATE Profesores
SET nombre = 'Jessy',
	paterno = 'Campos',
	domicilio = 'Av.Historia 111'
Where idProfesor = 1;

UPDATE Profesores
SET email= 'eva@example.com'
Where idProfesor = 5;

SELECT * FROM Alumnos;

UPDATE Alumnos
SET nombre = 'Oscar',
	paterno = 'Leon',
	materno = 'Hurtado'
Where idAlumno = 2;

SELECT * FROM Asignaturas;

UPDATE Asignaturas
SET idProfesor=10
WHERE idAsignatura=1;