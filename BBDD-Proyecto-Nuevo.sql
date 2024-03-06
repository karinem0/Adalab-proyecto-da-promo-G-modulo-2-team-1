CREATE DATABASE CinemExtract;

USE CinemExtract;

CREATE TABLE Peliculas (
    IdPelicula INT PK AUTOINCREMENT,
    Tipo VARCHAR(50), -- Tipo: Corto o Película
    Titulo VARCHAR(255),
    AñoEstreno INT,
    MesEstreno INT,
    IdPelicula VARCHAR(50)
);


CREATE TABLE Detalles (
    PuntuacionRottenTomatoes INT,
    PuntuacionIMDB FLOAT,
    Dirección VARCHAR(255),
    Guion VARCHAR(255),
    Argumento TEXT,
    Duracion INT,
    Genero VARCHAR(50),
    Titulo VARCHAR(255),
    anio INT
);

  

CREATE TABLE Actores (
    Actor VARCHAR(50),
    Anionacimiento INT,
    quehace VARCHAR(255),
    conocidopor VARCHAR(500),
    Premios VARCHAR(255),
    
);


CREATE TABLE PremiosOscar (
    Año INT,
    MejorPeliculaID VARCHAR (255),
    MejorDirectorID VARCHAR (255),
    MejorActorID VARCHAR (255),
    MejorActrizID VARCHAR (255),
    PRIMARY KEY (Año)
  );
