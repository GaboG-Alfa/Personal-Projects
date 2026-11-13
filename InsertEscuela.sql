USE Escuela
GO

INSERT INTO Auxiliares(nombre,paterno,materno,telefono)
				VALUES('Mirexa','Gallegos','Vega',999900001);


INSERT INTO Auxiliares(nombre,paterno,materno,telefono)
				VALUES('Manuel','Santana','Herrea',999900002);

INSERT INTO Auxiliares(nombre,paterno,materno,telefono)
				VALUES('Carla','Reyes','Prieto',999900003);

INSERT INTO Auxiliares
				VALUES('Cristobal','Sotelo','Aguilar',999900004);


INSERT INTO Auxiliares
				VALUES('Lida','Guillén','Benavides',999900005);


SET IDENTITY_INSERT Auxiliares ON;

INSERT INTO Auxiliares(idAuxiliar,nombre,paterno,materno,telefono)
			VALUES(6,'Juan','Leon','Blanco',NULL)

INSERT INTO Auxiliares(idAuxiliar,nombre,paterno,materno,telefono)
			VALUES(7,'Fernanda','Ortiz','Sanz',NULL)


SET IDENTITY_INSERT Auxiliares OFF;


INSERT INTO Auxiliares(nombre,paterno,materno,telefono)
			Values ('Gabriel','Parra','Bravo',999900006),
			('Jorge','Moya','Soler',999900007),
			('Marta','Nieto','Diez',NULL),
			('Raquel','Hidalgo','Iglesias',NULL);

INSERT INTO Colegiaturas(monto,fecha,estado)
			Values (400,'2024-01-01',1),
			(400,'2024-02-01',1),
			(400,'2024-03-01',1),
			(400,'2024-04-01',1),
			(400,'2024-05-01',1),
			(400,'2024-06-01',1),
			(400,'2024-07-01',1),
			(400,'2024-08-01',1),
			(400,'2024-09-01',1),
			(400,'2024-10-01',1),
			(400,'2024-11-01',1)

INSERT INTO Alumnos 
(idAuxiliar,idColegiatura,codigoAlumno,nombre,paterno,materno,fechaNacimiento,domicilio)
VALUES
(2,1,'A-102','Margarita','Martín','Sánchez','01/01/2000','Av.Brasil 130'),
(3,1,'A-103','Leticia','Gonzáles','Jiménez','01/01/2000','Av.Peru 237'),
(4,1,'A-104','Alberto','Romero','Navarro','01/01/2000','Av.Historia 485'),
(5,1,'A-105','Alejandro','Ramos','Gil','01/01/2000','Av.España 333'),
(6,1,'A-106','Daniel','Morales','Blanco','01/01/2000','Av.Historia 247'),
(7,1,'A-107','Felipe','Molina','Castro','01/01/2000','Av.España 652'),
(8,1,'A-108','Antonia','Rubio','Iglesias','01/01/2000','Av.Peru 742'),
(9,1,'A-109','Isabel','Santos','Garrido','01/01/2000','Av.Brasil 658'),
(10,1,'A-110','Luisa','Lozano','Cruz','01/01/2000','Av.Brasil 347');

INSERT INTO Asignaturas 
(idProfesor,nombre,horaInicio,horaFin)
VALUES
(1,'Matemática','09:30:00','10:30:00'),
(2,'Inglés','11:00:00','13:00:00'),
(3,'Comunicación','08:30:00','09:30:00'),
(4,'Química','10:30:00','12:30:00'),
(5,'Inglés','12:30:00','14:00:00'),
(6,'Matemática','08:30:00','09:30:00'),
(7,'Inglés','10:00:00','12:00:00'),
(8,'Comunicación','12:00:00','14:00:00'),
(9,'Química','08:00:00','09:30:00'),
(10,'Matemática','09:30:00','11:00:00'),
(11,'Inglés','11:00:00','14:00:00');


INSERT INTO Parentescos
(tipo)
VALUES
('Padre'),
('Madre')

INSERT INTO Tutores 
(idParentesco,nombre,paterno,materno,telefono)
VALUES
(1,'Manuel','Mondalgo','Guerrero',900000001),
(2,'Juana','Perez','Garrido',900000002),
(1,'Oscar','Martín','Cano',900000003),
(2,'Luz','Sanchéz','Rubio',900000004),
(1,'Alejandro','Gonzáles','Navarro',900000005),
(2,'Sara','Jimenez','Torres',900000006),
(1,'Ivan','Romero','Vásquez',900000007),
(2,'Nora','Navarro','Moreno',900000008),
(1,'Leo','Ramos','Garcia',900000009),
(2,'Mar','Mondalgo','Lopez',900000010);

INSERT INTO Profesores_Alumnos(idProfesor,idAlumno)
			VALUES(1,1), 
			(1,2),
			(1,3),
			(2,4),
			(2,5),
			(2,6),
			(3,7),
			(3,8),
			(3,9),
			(4,10);

INSERT INTO Calificaciones(idAsignatura,idAlumno,calificacion)
			VALUES(1,2,17), 
			(1,3,16),
			(1,4,18),
			(2,2,16),
			(2,3,15),
			(2,4,14),
			(3,2,15),
			(3,3,17),
			(3,4,19),
			(4,2,17),
			(4,3,18),
			(4,4,16);

INSERT INTO Alumnos_Tutores(idAlumno,idTutor)
			VALUES(2,1),
			(2,2), 
			(3,3), 
			(3,4), 
			(4,5), 
			(4,6), 
			(5,7), 
			(5,8), 
			(6,9), 
			(6,10);
		

SELECT * FROM Auxiliares ;

SELECT * FROM Colegiaturas;

SELECT * FROM Alumnos;

SELECT * FROM Asignaturas;

SELECT * FROM Parentescos;

SELECT * FROM Tutores;

SELECT * FROM Profesores_Alumnos;

SELECT * FROM Calificaciones;

SELECT * FROM Alumnos_Tutores;

DELETE FROM dbo.Profesores_Alumnos;
DBCC CHECKIDENT ('dbo.Profesores_Alumnos', RESEED, 0);

