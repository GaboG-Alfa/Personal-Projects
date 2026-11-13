CREATE TABLE Pelicula(
	idPelicula INT IDENTITY(101,1) NOT NULL,
	titulo     VARCHAR(200),
	presupuesto BIGINT,
	fechaLanzamiento DATETIME,
	ganancia   BIGINT,
	tiempoDuracion INT,
	calificación    FLOAT,
	
	CONSTRAINT PK_Auxiliares PRIMARY KEY(idPelicula)
);


INSERT INTO Pelicula (titulo,presupuesto,fechaLanzamiento,ganancia,tiempoDuracion,calificación)
				VALUES('Avatar',237000000,'10/12/2009',2787965087,162,7.2),
				('Titanic',200000000,'18/11/1997',1845034188,194,7.5),
				('The Avengers',220000000,'25/04/2012',15199557910,143,7.4),
				('Jurassic World',150000000,'9/06/2015',151328810,124,6.5),
				('Furious 7',190000000,'1/04/2015',1506249360,137,7.3),
				('Avengers: Age Of Ultron',280000000,'22/04/2015',1405403694,141,7.3),
				('Frozen',150000000,'27/11/2013',1274219009,102,7.3),
				('Iron Man 3',200000000,'10/12/2009',1215439994,130,6.8),
				('Minions',74000000,'18/04/2013',1156730962,91,6.4),
				('Captain America: Civil War',250000000,'17/06/2015',1153304495,147,7.1),
				('Transformers: Dark of the Moon',195000000,'27/04/2016',1123746996,158,6.1),
				('The Lord of the Rings: The Return of the King',94000000,'28/06/2011',111888879,201,8.1),
				('Skyfail',200000000,'1/12/2003',1108561013,143,6.9),
				('Transformers: Age of Extinction',210000000,'25/10/2012',1091405097,165,5.8),
				('The Dark Knight Rises',250000000,'25/06/2014',10849939099,165,7.6),
				('Toy Story 3',200000000,'16/06/2010',1066969703,103,7.6),
				('Pirates of the Caribbean: Dead Man´s Chest',200000000,'20/06/2006',1065659812,151,7),
				('Pirates of the Caribbean: On Stranger Tiders',380000000,'14/05/2011',1045713802,136,6.4),
				('Alice in Wonderland',200000000,'3/03/2010',1025491110,108,6.4),
				('The Hobbit: An Unexpected Journey',250000000,'26/11/2012',1021103568,169,7)


--Instrucción 1
SELECT *
FROM Pelicula;

--Instrucción 2
SELECT DISTINCT tiempoDuracion
FROM Pelicula;

--Instrucción 3
SELECT *
FROM Pelicula
WHERE tiempoDuracion = 165;

--Instrucción 4
SELECT *
FROM Pelicula
ORDER BY fechaLanzamiento ASC;

--Instrucción 5
SELECT TOP 5 *
FROM Pelicula
ORDER BY calificación DESC;

--Instrucción 6
SELECT TOP 50 PERCENT *
FROM Pelicula
ORDER BY ganancia DESC;
