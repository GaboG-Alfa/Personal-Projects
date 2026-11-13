CREATE TABLE Clientes(
	idCliente  INT IDENTITY(1,1) NOT NULL,
	nombre     VARCHAR(50),
	paterno    VARCHAR(50),
	materno    VARCHAR(50),
	edad       INT,
	fechaNacimiento DATE
	
	CONSTRAINT PK_Clientes PRIMARY KEY(idCliente)
);

INSERT INTO Clientes(nombre,paterno,materno,edad,fechaNacimiento) 
					VALUES('Carlos','Mora','Ruiz',34,'1992-01-01')

INSERT INTO Clientes(nombre,paterno,materno,edad,fechaNacimiento) 
					VALUES('Ana','López','Alfaro',26,'2000-01-01'),
					('Oscar','Alfaro','Castro',25,'2001-02-02'),
					('Marta','Ortiz','Gamboa',24,'2002-03-04');