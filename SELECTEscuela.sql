/*
*SELECT FROM
*/

SELECT *
FROM Profesores

SELECT nombre, paterno,materno 
FROM Profesores;

SELECT nombre, paterno,materno,telefono
FROM Profesores;

/*
*SELECT DISTINCT
*/

SELECT DISTINCT nombre FROM Asignaturas;

SELECT DISTINCT horaInicio FROM Asignaturas;

/*
*SELECT WHERE
*/

SELECT * 
FROM Profesores 
WHERE nombre = 'Wilmer'; 

SELECT * 
FROM Profesores 
WHERE idProfesor = 1 

SELECT * 
FROM Profesores
WHERE fechaNacimiento = '2000-02-13';

/*
*SELECT ORDER BY
*/

SELECT idProfesor, nombre, fechaNacimiento, domicilio 
FROM Profesores
ORDER BY nombre;

SELECT idProfesor, nombre, fechaNacimiento, domicilio 
FROM Profesores
ORDER BY nombre , fechaNacimiento;

SELECT idProfesor, nombre, fechaNacimiento, domicilio 
FROM Profesores
ORDER BY nombre DESC;

--Mala práctica
SELECT idProfesor, nombre, fechaNacimiento, domicilio 
FROM Profesores
ORDER BY 3,2;

/*
*SELECT TOP
*/
SELECT TOP 2 * 
FROM Profesores

SELECT TOP 2 idProfesor,nombre,paterno,materno 
FROM Profesores

/*
*SELECT PERCENT
*/
SELECT TOP 30 Percent idProfesor,nombre,paterno,materno 
FROM Profesores

/*
*SELECT WITH TIES
*/

SELECT TOP 4 WITH TIES  * 
FROM Calificaciones
order by calificacion DESC