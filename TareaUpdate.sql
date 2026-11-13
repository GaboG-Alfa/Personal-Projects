USE Pelicula;

SELECT * FROM Pelicula;

UPDATE Pelicula
SET calificacion = 8.5
WHERE idPelicula = 110;

UPDATE Pelicula
SET tiempoDuracion = 140
WHERE titulo = 'Avatar';

UPDATE Pelicula
SET fechaLanzamiento = '17/06/2010'
WHERE titulo = 'Toy Story 3';

UPDATE Pelicula
SET titulo = 'Desconocido'