USE Escuela
GO 

CREATE TABLE Auxiliares(
	idAuxiliar INT IDENTITY(1,1) NOT NULL,
	nombre     VARCHAR(50),
	paterno    VARCHAR(50),
	materno    VARCHAR(50),
	telefono   INT
	
	CONSTRAINT PK_Auxiliares PRIMARY KEY(idAuxiliar)
);

CREATE TABLE Asignaturas(
	idAsignatura INT IDENTITY(1,1) NOT NULL,
	idProfesor   INT,
	nombre	     VARCHAR(50),
	horaInicio   TIME,
	horaFin      TIME

	CONSTRAINT PK_Asignaturas PRIMARY KEY(idAsignatura),

	CONSTRAINT FK_Asignaturas_Profesores
		FOREIGN KEY (idProfesor) REFERENCES Profesores(idProfesor)
);

CREATE TABLE Colegiaturas(
	idColegiatura INT IDENTITY(1,1) NOT NULL,
	monto         DECIMAL(7,2),
	fecha         DATETIME,
	estado        BIT

	CONSTRAINT PK_Colegiaturas PRIMARY KEY(idColegiatura)
);

CREATE TABLE Alumnos(
	idAlumno     INT IDENTITY(1,1) NOT NULL,
	idAuxiliar   INT,
	idColegiatura INT,
	codigoAlumno  VARCHAR(50),
	nombre	     VARCHAR(50),
	paterno      VARCHAR(50),
	materno      VARCHAR(50),
	fechaNacimiento DATE,
	domicilio       VARCHAR(50)

	CONSTRAINT PK_Alumnos PRIMARY KEY (idAlumno), 
	CONSTRAINT FK_Alumnos_Auxiliares
		FOREIGN KEY (idAuxiliar) REFERENCES Auxiliares(idAuxiliar),
	CONSTRAINT FK_Alumnos_Colegiaturas
	    FOREIGN KEY (idColegiatura) REFERENCES Colegiaturas(idColegiatura)
);

CREATE TABLE Calificaciones (
    idAsignatura INT NOT NULL,
    idAlumno     INT NOT NULL,
    calificacion INT,
    CONSTRAINT PK_Calificaciones PRIMARY KEY (idAsignatura, idAlumno),
    CONSTRAINT FK_Calificaciones_Asignaturas
        FOREIGN KEY (idAsignatura) REFERENCES Asignaturas(idAsignatura),
    CONSTRAINT FK_Calificaciones_Alumnos
        FOREIGN KEY (idAlumno) REFERENCES Alumnos(idAlumno)
);

CREATE TABLE Parentescos (
    idParentesco INT IDENTITY(1,1) NOT NULL,
    tipo         VARCHAR(50),
    CONSTRAINT PK_Parentescos PRIMARY KEY (idParentesco)
);

CREATE TABLE Tutores (
    idTutor      INT IDENTITY(1,1) NOT NULL,
    idParentesco INT,
    nombre       VARCHAR(50),
    paterno      VARCHAR(50),
    materno      VARCHAR(50),
    telefono     INT,
    CONSTRAINT PK_Tutores PRIMARY KEY (idTutor),
    CONSTRAINT FK_Tutores_Parentescos
        FOREIGN KEY (idParentesco) REFERENCES Parentescos(idParentesco)
);

CREATE TABLE Alumnos_Tutores (
    idAlumno INT NOT NULL,
    idTutor  INT NOT NULL,
    CONSTRAINT PK_Alumnos_Tutores PRIMARY KEY (idAlumno, idTutor),
    CONSTRAINT FK_Alumnos_Tutores_Alumnos
        FOREIGN KEY (idAlumno) REFERENCES Alumnos(idAlumno),
    CONSTRAINT FK_Alumnos_Tutores_Tutores
        FOREIGN KEY (idTutor) REFERENCES Tutores(idTutor)
);