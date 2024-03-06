CREATE DATABASE Proyecto_CinemExtract;

USE Proyecto_CinemExtract;

CREATE TABLE Peliculas (
    Tipo VARCHAR(50), 
    Titulo VARCHAR(255),
    AnioEstreno INT,
    MesEstreno INT,
    IdPelicula VARCHAR(50),
    PRIMARY KEY (IdPelicula)
);

CREATE TABLE Detalles (
    PuntuacionRottenTomatoes INT,
    PuntuacionIMDB FLOAT,
    Direccion VARCHAR(255),
    Guion VARCHAR(255),
    Argumento TEXT,
    Duracion INT,
    Genero VARCHAR(50),
    Titulo VARCHAR(255),
    IdPelicula VARCHAR(50),
    PRIMARY KEY (Genero , IdPelicula),
    FOREIGN KEY (IdPelicula) REFERENCES Peliculas(IdPelicula)
);
 

CREATE TABLE Actores (
    Actor VARCHAR(50),
    AnioNacimiento INT,
    QueHace VARCHAR(255),
    ConocidoPor VARCHAR(500),
    Premios VARCHAR(255),
    PRIMARY KEY (Actor)
);


CREATE TABLE PremiosOscar (
    Anio INT,
    MejorPelicula VARCHAR (255),
    MejorDirector VARCHAR (255),
    MejorActor VARCHAR (255),
    MejorActriz VARCHAR (255),
    IdPelicula VARCHAR(50),
    PRIMARY KEY (Anio),
    FOREIGN KEY (IdPelicula) REFERENCES Peliculas(IdPelicula)
  );