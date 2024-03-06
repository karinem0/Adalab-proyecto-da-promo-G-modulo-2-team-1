CREATE DATABASE CinemExtract;

USE CinemExtract;

CREATE TABLE Peliculas (
    PeliculaID INT PRIMARY KEY,
    Tipo VARCHAR(50), -- Tipo: Corto o Película
    Nombre VARCHAR(255),
    AñoEstreno INT,
    MesEstreno VARCHAR(20),
    Genero VARCHAR(50),
    IdPelicula INT
);

CREATE TABLE Reseñas (
    PeliculaID INT,
    PuntuacionIMDB FLOAT,
    PuntuacionRottenTomatoes FLOAT,
    Director VARCHAR(255),
    Guionistas VARCHAR(255),
    Argumento TEXT,
    DuracionMinutos INT,
    PRIMARY KEY (PeliculaID),
    FOREIGN KEY (PeliculaID) 
    REFERENCES Peliculas(PeliculaID)
);

CREATE TABLE Actores (
    ActorID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    AñoNacimiento INT,
    ConocidoPor VARCHAR(255),
    Actividad TEXT,
    Premios TEXT,
    PeliculaID INT,
    FOREIGN KEY (PeliculaID) REFERENCES Peliculas(PeliculaID)
);


CREATE TABLE PremiosOscar (
    CeremoniaID INT PRIMARY KEY,
    FechaCeremonia DATE,
    MejorPeliculaID INT,
    MejorDirectorID INT,
    MejorActorID INT,
    MejorActrizID INT,
    FOREIGN KEY (MejorPeliculaID) REFERENCES Peliculas(PeliculaID),
    FOREIGN KEY (MejorDirectorID) REFERENCES Actores(ActorID),
    FOREIGN KEY (MejorActorID) REFERENCES Actores(ActorID),
    FOREIGN KEY (MejorActrizID) REFERENCES Actores(ActorID)
);


---- FASE 7: Realización de Consultas para Obtener Información----


-- ¿Qué géneros han recibido más premios Óscar?

SELECT COUNT(*) AS CantidadPremios, MejorPelicula
FROM PremiosOscar
GROUP BY MejorPelicula
ORDER BY CantidadPremios DESC;

-- ¿Qué género es el mejor valorado en IMDB?

SELECT Tipo, Nombre, PuntuacionIMDB
FROM Peliculas
ORDER BY PuntuacionIMDB DESC
LIMIT 1;

-- ¿En que año se estrenaron más películas?

SELECT AñoEstreno, COUNT(*) AS CantidadPeliculas
FROM Peliculas
GROUP BY AñoEstreno
ORDER BY CantidadPeliculas DESC
LIMIT 1;

-- ¿En que año se estrenaron mas cortos?

SELECT AñoEstreno, COUNT(*) AS CantidadCortos
FROM Peliculas
WHERE Tipo = 'Corto'
GROUP BY AñoEstreno
ORDER BY CantidadCortos DESC
LIMIT 1; ---- ¿?

-- ¿Cuál es la mejor serie valorada en IMDB?

SELECT Tipo, Nombre, PuntuacionIMDB
FROM Peliculas
WHERE Tipo = 'Serie'
ORDER BY PuntuacionIMDB DESC
LIMIT 1; ---- ¿?---

-- ¿Cuál es la película mejor valorada en IMDB?

SELECT Tipo, Nombre, PuntuacionIMDB
FROM Peliculas
WHERE Tipo = 'Pelicula'
ORDER BY PuntuacionIMDB DESC;

-- ¿Qué actor/actriz ha recibido más premios?

SELECT Nombre, COUNT(*) AS CantidadPremios
FROM DetallesActores
WHERE Premios IS NOT NULL
GROUP BY Nombre
ORDER BY CantidadPremios DESC
LIMIT 1; 

-- ¿Hay algun actor/actriz que haya recibido más de un premio Óscar?

SELECT Nombre, COUNT(*) AS CantidadPremios
FROM DetallesActores
WHERE Premios LIKE '%Oscar%'
GROUP BY Nombre
HAVING COUNT(*) > 1;



