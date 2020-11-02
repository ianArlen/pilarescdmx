

DROP TABLE IF EXISTS LCPO;
DROP TABLE IF EXISTS PILAR;
DROP TABLE IF EXISTS SUBOPERATIVA;
DROP TABLE IF EXISTS DIRECCION;
DROP TABLE IF EXISTS UNIDTERRITORIAL;
DROP TABLE IF EXISTS ASENTAMIENTO;
DROP TABLE IF EXISTS ALCALDIA;
DROP TABLE IF EXISTS ESTADO;


CREATE TABLE ESTADO(
	ID  SERIAL PRIMARY KEY,
	ESTADO		CHAR(30)	NOT NULL
);


CREATE TABLE ALCALDIA(
	ID  SERIAL PRIMARY KEY,
	ESTADOID INT NOT NULL REFERENCES ESTADO (ID),
	ALCALDIA		CHAR(30)	NOT NULL,
	CLAVE		CHAR(4) NOT NULL			
);


CREATE TABLE ASENTAMIENTO(
	ID  SERIAL PRIMARY KEY,
	ALCALDIAID INT NOT NULL REFERENCES ALCALDIA (ID),
	CP		CHAR(10)	NOT NULL,
	NOMBRE		CHAR(50)	NOT NULL,
	TIPO		CHAR(15)	NOT NULL,
	ZONA		CHAR(15)	NOT NULL
);


CREATE TABLE UNIDTERRITORIAL(
	ID  SERIAL PRIMARY KEY,
    ALCALDIAID INT NOT NULL REFERENCES ALCALDIA (ID),    
	CLAVEUT		CHAR(10)	NOT NULL, 
	NOMBRE		CHAR(90)	NOT NULL,
	MARGINACION		CHAR(10) NOT NULL
);

 
CREATE TABLE DIRECCION(
	ID  SERIAL PRIMARY KEY,
	ASENTAMIENTOID INT NOT NULL REFERENCES ASENTAMIENTO (ID),
	UNIDTERRITORIALID INT REFERENCES UNIDTERRITORIAL (ID),
	DIRECCION		CHAR(90) NOT NULL
);

 
CREATE TABLE SUBOPERATIVA(
	ID  SERIAL PRIMARY KEY,
    ZONA		CHAR(50)	NOT NULL
);

CREATE TABLE PILAR(
	ID  SERIAL PRIMARY KEY,
	DIRECCIONID INT8 NOT NULL,
	UNIQUE (DIRECCIONID),
        FOREIGN KEY(DIRECCIONID) REFERENCES DIRECCION(ID),
    SUBOPERATIVOID INT NOT NULL REFERENCES SUBOPERATIVA (ID),
    NOMBRE		CHAR(50)	NOT NULL,
	INAUGURADO		CHAR(50) NOT NULL
);


CREATE TABLE LCPO(
	ID  SERIAL PRIMARY KEY,
	PILARID INT8 NOT NULL,
	UNIQUE (PILARID),
        FOREIGN KEY(PILARID) REFERENCES PILAR(ID),
    NOMBRES		CHAR(50)	NOT NULL,
    PATERNO		CHAR(30)	NOT NULL, 
    MATERNO		CHAR(30)	NOT NULL,
    EMAIL		CHAR(50)	NOT NULL,
    CELULAR		CHAR(14)	NOT NULL
);