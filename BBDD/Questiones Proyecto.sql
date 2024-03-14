USE proyecto_cinemextract;

-- 1. ¿Qué géneros han recibido más premios Óscar? --

SELECT Genero, COUNT(*) AS CantidadPremios
FROM PremiosOscar AS po
JOIN Detalles AS d ON po.IdPelicula = d.IdPelicula
GROUP BY Genero
ORDER BY CantidadPremios DESC;

-- 2. ¿Qué género es el mejor valorado en IMDB? --

SELECT Genero, ROUND(AVG(PuntuacionIMDB), 2) AS PuntuacionMedia
FROM Detalles
GROUP BY Genero
ORDER BY PuntuacionMedia DESC
LIMIT 1;

-- 3. ¿En que año se estrenaron más películas?  --

SELECT AnioEstreno, COUNT(*) AS CantidadPeliculas
FROM Peliculas
GROUP BY AnioEstreno
ORDER BY CantidadPeliculas DESC
LIMIT 1;

-- 4. ¿En que año se estrenaron mas cortos? --

SELECT AnioEstreno, COUNT(*) AS CantidadCortos
FROM Peliculas
WHERE Tipo = 'Cortometraje'
GROUP BY AnioEstreno
ORDER BY CantidadCortos DESC
LIMIT 1;

-- 5. ¿Cuál es el corto mejor valorado en IMDB? --

SELECT COUNT(*) AS TotalCortos FROM Peliculas WHERE LOWER(Tipo) LIKE '%corto%';

SELECT p.Titulo AS TituloCorto, d.PuntuacionIMDB
FROM Peliculas p
JOIN Detalles d ON p.IdPelicula = d.IdPelicula
WHERE p.Tipo LIKE '%Corto%'
ORDER BY d.PuntuacionIMDB DESC
LIMIT 1;

-- 6. ¿Cuál es la película mejor valorada en IMDB? --

SELECT p.Titulo, d.PuntuacionIMDB
FROM peliculas AS p
JOIN detalles AS d ON p.IdPelicula = d.IdPelicula
WHERE p.Tipo = 'Pelicula'
ORDER BY d.PuntuacionIMDB DESC
LIMIT 1;

-- 7. ¿Hay algun actor/actriz que haya recibido más de un premio Óscar? --

SELECT Actor, COUNT(*) AS CantidadPremiosOscar
FROM (
    SELECT MejorActor AS Actor 
    FROM PremiosOscar 
    WHERE MejorActor IS NOT NULL
    UNION ALL
    SELECT MejorActriz AS Actor 
    FROM PremiosOscar 
    WHERE MejorActriz IS NOT NULL
) AS PremiosOscarTotales
WHERE Actor IS NOT NULL
GROUP BY Actor
HAVING COUNT(*) > 1;

